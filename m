Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86EE4E3226
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657924; cv=none; b=tQ5uNgysSxhzbowONdGGumAQzL8uJJm6Pc4yvNjL0fNQ6bmZ49dtFC6jFRLC6wI+zrGzmBQiK2fTd/MzikgUzrbdpiXZA/VnouiBFbSO/Zp9Mu+dsUL6RUTk4FPFSUJWWJYN6qpdzsBfq785TLAkslQw3yOTrd8dXio8TjmcifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657924; c=relaxed/simple;
	bh=0gsclMCHcuOmrwzDH/JSLwc8gzWae+HvKvf4zt/xVeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1+41/blbm5GhXf8gwYkdHV319GZ9SQB35FvThROotOmX+4i2UCnut00Lpeibfno+Wt4Jp79F0qCxya6ueCy+J+ozLra0QLutsaAowlIboDBv3Y5O1J5ghANNSvYvACpABZccwqDvra5JigSCVa/1N/R35p8Zg/1NuFffVqfwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4UxmfcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3YGi/Fp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4UxmfcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3YGi/Fp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDk4V41955202
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HH/QhDPO8yKfe0CEjILireN9
	JNd79C76sE8RnbUnsVo=; b=Q4UxmfcSDfFGvNpxA9Qxn0hKBZwtAkenBc8jV8i5
	q4ZgKiOyNOyJSwV+Zt1NsnsUthCoijEO5swCsTsYhHnF/1H4nORiHQMdWAXvqtjq
	RJHHPXOZYSWl/xsPQgQ0NrfZu9rs2CBWWWstzCuRQseuBx3fNW+/JQjvC/1tOrzs
	EQtngha7Fy2Sf0rDkibuagviuaKR+8pO/dd0JeaP3Gq5+51EFeDN8XRXDY+8Hkd+
	A2w4LGLb+zeiyUOzelaVKE8BSAnD/uDMywf3n7HM36c5NZEw3UByc1SO4P6F+QaL
	2jdlpMCaBAzAJji+mqBWrH0Z0y5KZBsECs8wa2YXC/kC1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gn40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so180587585a.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657907; x=1790262707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HH/QhDPO8yKfe0CEjILireN9JNd79C76sE8RnbUnsVo=;
        b=S3YGi/FpgdL0ug1ghSAC5kQmeER3Yr2KSreOw/gddkJdufLql63Brj1U+o/Is5DQUV
         vrO4c4rt4UWOzOB63a/9sCsGMGPHOxcGrDgyGVwPeq8Xl6asl8fxxsOfpcgfiXKLj0Sl
         LWjk1IGaOcXSS1vjZoDH9rKbzRiHopKC9trD8r63MDbDHOWNd1ODEIODiI4gXEDsPy/O
         AlG0okhruKw6U+r2otGdbl7dNasi2B3E1eE2UepARN6GnAfaR5TQbWP6Ps7pmgeiL7Ii
         D4gh1FqVhxd5acholus2SbYVLtHTHynLUjWkWc8Xb5Ng7cJA1FBU53dzLytm9quFfU6A
         54GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657907; x=1790262707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH/QhDPO8yKfe0CEjILireN9JNd79C76sE8RnbUnsVo=;
        b=xdHe/o186nArlsfD3CoxSt6wYzgJLPcyfGQAzPyyLMixHJ/hkqD+X5LX+Yl9/byr3b
         qzJgncUOjF2oYDkShvg55sL7JJt3896EehVA4u1vDo4vbKMOxso5EOlwJ0FBRBAA3/OB
         7A1QvDdflvLdJrSp6Kf+7AD4EGGJq4lNnt1JZGrS9b6a0bee9PpuCflFMH9tIj1AKTHU
         irDq1B3jZmRas55MriKoJmipVeG4ylySXOND/PJTm28SpbeHQ+AYqOtuYy4vueVmOpCV
         PonY8gJgHDCJt6Q55MuiA58LOYJ3vmsl0I8evCg0eIqs3iuuzEwL425425QhTuWDFR2E
         ut1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLmgdSueeJ96EDeSzh5clrOreU6wJUBRuzuaIVjX6pKKVBUwgFNpCXsWixUCd2c2RJmRfYwKJ+VDda@vger.kernel.org
X-Gm-Message-State: AFuF++nX8msRLIYqBt4AkoWsJTSuvRPOQgNR2lijjqA/2MUtcZmB40hB
	4U5Al1oIgW0ROIq/zio2R8lxmVzn0U5F9bPROiwNnvAHwJrjKedhdyFLv/pr9djW7rzXB/Whm95
	dSil3bIxnUkFkAaN8dxwRcq5vH2Ysm8usYKsRmSTrQAxHqQm6da0zvYgemVvSEmDB
X-Gm-Gg: AYBFou0y7GyVHlmOd7s8zvQHGvY/q1RJIn8pY9NzVQ72RQox70zX9OlbKfln9x7TSTO
	6C5wTHBibp8+oDnpF+juLbwz4zgKtkKRXAfL8V7KdqYqtk19NkXnPhRjP4mHCw896deEmGmDCjb
	vKj2l1CjEObhsdzfDhrT1SJYJcRUpsDbZoY51BcKINTXRb2rh0mI5xhr64GEqGzbucizVZD4c0r
	GgNz9ZXtUEMZxHLt7fuLg0+sSHoZwQLkg3TtQJEHEkwFWyO5da+Hdp9PZ0tODSsU/r4Trv4YRW1
	DXcQeFXFyXSz+Rvqt7BHiIYLNC607wmZJbj9IidRFzkPMr3D4oOOWNftiF3y5eAARYyY4C2tk2a
	+6AmMhb7I4CFhxw==
X-Received: by 2002:a05:620a:2788:b0:939:46d7:4b4e with SMTP id af79cd13be357-93bb76ba947mr1386314785a.7.1789657907132;
        Thu, 17 Sep 2026 08:11:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:939:46d7:4b4e with SMTP id af79cd13be357-93bb76ba947mr1386305985a.7.1789657906429;
        Thu, 17 Sep 2026 08:11:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm18004156f8f.1.2026.09.17.08.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:45 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 03/15] arm64: dts: qcom: qcs404: Move PCIe phy and
 GPIOs to root port node
Message-ID: <j2ib2y6zr2uagqsyhy5miuma2hpnk2h57yqtkese4rsq4pj7sw@flcypjnbcdpx>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX6FJVmpiqBlIR
 9fWosSUYJNF7Bp3XJS6ZzqDT6tDmnzihFTmd8YZEpYdOEpmk+I+m8y0fZTE6Q51BEGChSkvY8ty
 O+jahXxwumMPXsAUF79SFCKN5kTcaXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX/xU70icm9zGN
 E736boDjmxPjwbpQzhAvZMGzFwBkHs/ijR7l/2LUHPKE69E1ERqqr5LM4Rws+tSWHHU/oT19KdZ
 8uzdQwvL+znx0mSmL9vyBfXoJbgrG+ejtMRvUexCVtkT2wfUGJWELoOvbjYo5K4Z+KQJe9zbR1l
 o/XiqGulEIn4zdaR0anXEyFjT0i+OOTYq3nvi1fdQf6Fu6cElR+zyR787weSbRT46CWltvXWHTM
 p/apx/SM460aDLaTO9mD6FEfu9eO3PZj8BxqMDziPQ/d/ROCIfPMpOQZ8JJuK2Yp684s7xi5qVF
 kuhJrHN/UA8sK5ixeVhW5L2zQB+nA8tOM5l8tc4oZHkh/hBevH/NZpFVzbr3nMVOl4V1qNcMueA
 XM2pnXBCSPEtzZVCVrzYZMVz3zdL4EWOnPHhOs9sHCWGXu4JgvBzNRtd0jhO4uRPheSndeQeb7V
 G+dcGBgE8wm8aB8NcBg==
X-Proofpoint-GUID: RkxP92wUV6NEK2eq0kFvS6cm-4qVzOUO
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac0334 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RkxP92wUV6NEK2eq0kFvS6cm-4qVzOUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:17, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys and phy-names from the controller to pcie0_port0,
> adding a label to this node to allow board-level overrides. Move
> perst-gpios from the &pcie controller override to &pcie0_port0 in
> the board file, renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
