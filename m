Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B390371876
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 04:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754388; cv=none; b=p1vrFjogEuaqytsOyxj1MPFfD6G7a1JRz4Q0RG1WWA/KmXPfNRdxiuky2dx5oLUXqxRTMqewb6RprwglMgCqpaIsidn+gWlnkbihCyp6cmlYFO45Y5GP9rJ4ynQE+JSIJuImvhhmY839UvZFCg+Mz8YiiCbxMekfBQibaFK+AXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754388; c=relaxed/simple;
	bh=L3M4rtvc3A0eRf+0aPCA5opGsYbyXqlehT5TgFW1/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brJahFV4go1+PTHLtmBJYB4czwKLCKuG4uf+f5Q7694Vzjpk3GqgC0fClClkAXeWvRXB+gkkFzMp52z8TM0Zg/IgBPwBlg9Hwmllc/0sLLetkZ/MO9DxI5Jaa1TP1mpS/5I4tbDst6/Pp9r1gEqPl4jFIAWgpnIikr6Tb5DVlLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsHJKGl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPQTppv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsHJKGl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPQTppv+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kvKk3712169
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 04:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=22U0nA4uBRDIsUT6kuK31Aj8
	XdWWpRxfWwREwxpHug4=; b=bsHJKGl3/JhFmZ9rswmII6z2tPN3F3HbElcCh39R
	Pbpq2XoO0eueR6GYh2s6ytMPl+SXmnhZcS2mejyjr8AHDTiE3DRKOdrYcs8RFecB
	whilhutlPHlhxlkcLroSeY7vpb7dJBI3oPEdLf51jSkBhtBrN0rNeOmqrvs+PVAV
	GvG4RHUJcyMmkTLHTbHIG4T2OuLLM6BQQwU10Sb6A+vBrLtN6R3bbUdF+4JlPIyn
	4haSS6/bIaqz7cVQvJA0tomu/xRCWxSM7PyAJIQuUw4hQ8PTyz7jXlrGF1JgQCUV
	/MGMAM+l4b103HSX/c6Nf1ELS1y1NtgQERI3+gtZ0LZUdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjgqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:13:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1299289a91.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 21:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788754386; x=1789359186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22U0nA4uBRDIsUT6kuK31Aj8XdWWpRxfWwREwxpHug4=;
        b=EPQTppv+kDyfe6OIz22Sa2czyiDsOdEEMF6KZumAAoAL0Ht3sWQXGXHA6JxYTvr3SL
         8lWPZgr6e3gNB31nCAdVruxSrTO01QyB1AvjimTAxs1/vJxGGEr5vpi+f4m8RvSCQQOr
         u+M4X1oz0ClRH+2hEaTbMKkBn8ro176sdn2+sLfeBC0FTuU6lnh47fgzTf+wvskzqQtL
         VicFC0eM4L2V09cxcEaGYylZP536IMG7Y/edKMwgPO2HrQRsV8R/2vZfiJzsroZKMjaQ
         FtNeHlL9Lu5K5XVdfCVoZsSgE72eNWr9pJIgR4/67CsQQmOP2WaLgdDr99bv3RxZMLQ9
         I/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788754386; x=1789359186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22U0nA4uBRDIsUT6kuK31Aj8XdWWpRxfWwREwxpHug4=;
        b=fNB1MJCaSnKAdscYt5GmDgdTGtDCUqX2qP+uUjsBqF3gRMQ3tQ55p7WpgnWDlTCgMm
         Jtt0XoZxYrPbNHOJOQzuxM4o3hCGsLznri0WJxsxPhaa57qZVaiuRMCW/vWqV484bNMo
         oEdZLKPrtWa1OGrn1lzaeqEjzl1rIztDq5d9lU9y+NmlEI+gmkwkGt3Zfdf5CwABwxmE
         u4+WSMYl9Tw6IJ6HVfhgLXm3RNLKax6ha34RVyXndVFMmRQH1N676X8bSuTPsfLZ77iX
         Uwo4LlPUXt0yPyNBZ8uekzZ5p7LjTcoKLD/jITNVXp3W8x6A4zDYptMGV+EeCPy6LODV
         iJPQ==
X-Forwarded-Encrypted: i=1; AKwUvByK0rxWpkuMWuzGVvY3QQDxId0Eev+QDPGYgn8pS4xmza3VoLNQfDXmJBo+DPcioN7seVwNmq9d4LQ1@vger.kernel.org
X-Gm-Message-State: AFuF++naADedQqbTybqdWJEO0tDNCfbLg4gbXsyVGsVIPBVn4STfvUwG
	KqhVxXNu+tttjPEjP1P8jyYU4bYCOC4hLmIiJCkMuTwRSMfsaGQxaCp0bdYlynGMA5XDoVgTrn4
	BRatE1Dmzt/cuFQDpbH9+u4mOO599BbxaSMG1vs8LsJ3GSaIfJrE3QAt5l4gYBAb9
X-Gm-Gg: AYBFou1+afEVGadeAmpjk7UbUqZNIg9Dy1auYuuO2p/U9NGgKYbXQdt4pULJerAk493
	czK2bLwkDGbfu1xSTuzTxIN3xrzPbRXaNYtI7Nkrn14gMqqcJn1WanBF3mjIEuFpvAoqRcFKyS2
	SKQlEwe9KQ9uYqM4ZgfSFZPZQU5qxwGA10M6WY8K7BQQKlTr1hBRM31hR6Hgmz75z3d8v44hFFW
	cLhbD+3ezJi4IPIrFtAP7Em7tG7iGtiN+zNSiHRfCmRVtObh9lLA/dd8OZMXxtigBwDnV0rsTAi
	aV93fl0UTBnYZUQE3fKq8Do7AAMGHxaX8XZcMPfU0mEYwNx9mKhZI2siDjE4xiSfTvztrKd8+sg
	2CreAr1GojUWhDHOwQ5HauC4gzDM935QrPGyewkkkRHWLpxp+VQz6o1Viy+lFj4e1cSXMCGmfO7
	nizRYmHeUySou+DL/A7hWDE7zngkFRPw==
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32327150a91.20.1788754385543;
        Sun, 06 Sep 2026 21:13:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32327108a91.20.1788754385032;
        Sun, 06 Sep 2026 21:13:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm15766714c88.8.2026.09.06.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:13:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:42:58 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for IPQ9650 USB controller
Message-ID: <ap45yiuO2cgnRQFh@hu-varada-blr.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0MSBTYWx0ZWRfX2qdAxYjMMcUW
 9V1rNsWfEE8yqecqlDyakpLdmmcgpsqiZmZx2++JQeFrqaj2DA/YVbwLSRtGLYR7XOevU6AhH7S
 Rpnk4QEjWHDPrn//8M4hB92QllkARkc=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e39d2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BlFRT9tzNkAzCq5auagA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Lqp9G0U-fUQdqa1Zi2ecngt8IqMAFqhx
X-Proofpoint-ORIG-GUID: Lqp9G0U-fUQdqa1Zi2ecngt8IqMAFqhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0MSBTYWx0ZWRfX1H5KW6hgm8kc
 1nIiZhv3hTbLqV8SF2diqUQ945KtkV9cANB8gJvylJw9CJ6ifrtO+V0kKedkcEzt6aP9S28unX6
 3m7s7F9vSMW1QVHFWD3g2yrTKt+TBSN/35uS6jlmFnQluOUR4rnlM28zLl2NMu4OC6uNBensX3j
 eXsQ5A7CYWTxEVNCYP4HwtAcKcwpjzTSNTscaatci4ClZ/1Y8bUn9h3NeQmGYGZF3KDVV4HyKbz
 I5SrpCe3ZNbShwLkY29/a7TC8hn4UAM860+bb7yOuehY8rEUyugQnS1mdm2pX98cBlgvvhiIkNg
 /2stYfIsxDSY6g4QoOXzpiyjh9ymFimOyogbhSIB4dDNWbO3h3b5ooD4x6x3/tQ+6BihFUDZHx/
 YenXK4osLFUDmKNLlBz2FLoD1t/6JcsIjXQUKu4hm+kTUrap1z2RXlg4mhFBjRAu/ytDmO+T6Xe
 gKDtdP8PL2trL/0R79g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070041

On Tue, Aug 25, 2026 at 10:38:31AM +0530, Varadarajan Narayanan wrote:
> Add bindings and dwc3-qcom glue driver changes for adding support to the
> two USB controllers present in IPQ9650.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> Varadarajan Narayanan (2):
>       dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650 compatible
>       usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core

Abandoning this and will use [1].

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com/
