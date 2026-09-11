Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641FD381E85
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133735; cv=none; b=LjSnArpSbcbKuH0Np+Y+nKz+Z+4TGGwclYf33PMO5Y8oZnvXkNVFWjWEKX0eYEn/1lkcppMcQmbsAaT5e/6fvmtgDEaxpHE4dP/Ww54Ox2EYsv36DS4dfkeZhKUH03EDSO556qFcY+ss9UdVdFByFgncs9Py85BjdhvJmxx4Ywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133735; c=relaxed/simple;
	bh=Bdr58TASYAcnDyr8NYgzvmX/VNnrlFvX5qTimGt4OLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXdVKKVDHI3qTI1K4wS2nMvsTg4H/qtTRQRBv1GP5NWGrQLnSd3HDieoo5GeMjLqu32Ojri3ETfQ4GcAkhQiWIvFipMgXSu0rKvu7cOuPoZlFvCS3qvURF8DkpYY+an3AtgYNDNdgbbePSg8hZAj0MwDcEwv4SuKD8cta5RbRhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QS0btX3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVKpvD/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QS0btX3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVKpvD/W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiY1k3473491
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7fDBLHg2JhK2hYvJq0Kdbjyb
	j3USOEIeZfURdTQMJP4=; b=QS0btX3VTC64YMnoJ0GS1sbqxEsPlWBbiO0cKvwV
	WZAQTjjtoRpG72dSt83l0Rv3CBXnFLuYD6YfMH72HScYda8Y+tW5eEA6vBMzg+Al
	Qx9jCO/3SaD4tXTzS5DypjFJQu4f9jXgRBXEpUIEHRcLIymgY3/57czuEXtXeTms
	VPBh+tMEZbgtgxe2XyG2njcmnaVDpS9eqIqKtuC9nWU83oNqDzPOZW2KcddrYLmE
	P2gsHmWe8uSq1XrQQwj+Gr4eE/G4Zrc/UU8A52gWZNDd2HyQgBBX7UHuZtkCf57l
	CgSrBC7fDh/+nB323OL7SWYvGDLrndMwuZP9GiwVxv9kWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729jvfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:35:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so140084385a.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133733; x=1789738533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7fDBLHg2JhK2hYvJq0Kdbjybj3USOEIeZfURdTQMJP4=;
        b=iVKpvD/Wx5ttv067ZJzAwzpPGeZpsH4RQoUKAfv5CIRMfW/4SId/cPYKbog8AI7wlQ
         se7PihJqxO1IyXiIIMYElf7+r7vy9Mq0IS8QwjwzCmzU1hbzNd8ybatf8ZwYHf87+MKs
         72gkVswm0WUifgXhfTjsmW7HYUZTprZVsNjlo6MoB/bM7UWKMPhg4Fq3LFokRGeoZT+b
         DxCWLIbjLewLse+Nmz6SiIZoe0/SXl/kgm8wXMFqcYTq2siVnuqAes6Hk5AbMemrUc+n
         glfPxf0ZuLzT4t+ZwopRwlpm95XzPPP4lr1ozgpA8I1fxlQ5yg07PYpLL/oesqXgU5xB
         bd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133733; x=1789738533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fDBLHg2JhK2hYvJq0Kdbjybj3USOEIeZfURdTQMJP4=;
        b=dgy0DnbbgE9wQISLtWBEq+el84iKkIFvqAzHsAuzSU/qd+8wDpmTT/pyU4IiHCI340
         8DgY5jvsjLsQAPq99XuoL54XRf6aeJQfwFZuHCieek+u/mNf668Olr2w0WAG9z7bTYI9
         tqGSwSFCMsYEqZTnYFAxMiPzoTfmaLU6MacbvJJ8Ahy+ZiPfWgljyKjjuboy4tGAqWA7
         py+n33v2eVfA+YTECoz/zNebHLvAQnX7BlkubCilZXO1ZsbL2Ph5FzG36kQ7DKD08rbJ
         7dGq8Q6V0KE66Mq2By9xaw7SfDU56b1IMmFyLzXNgxpMQW6knl04nm5t6MnRVJ/q+p91
         XJOA==
X-Forwarded-Encrypted: i=1; AKwUvByUGBIypb/TauQKbv5MzbY/bEhGRz1NiLjLMc5SaLGT0FUcIDc4UjQGLJ//mHZSbJvrpPuB14jnRUP3@vger.kernel.org
X-Gm-Message-State: AFuF++naVntjdKi/IQdw0NBZqx6vMxkXENrOsAkyaT/K2YJKLcK8Id2X
	HB8VDGlcPqR1GNk2fJ7uoAm2eSOGBYahYnh9/+VjpP1K3qQooJ/p1c0T2/mXHSVCHbR4x4ytpuD
	zM2dZd4fZzf5fh8jHzZiZbd4Z5CQblJ4K2r9rQrmEZowxz+msekWTRjRHUFVke6as
X-Gm-Gg: AYBFou0mmn5G6kGey0diEGYQZPZ7APdlaH/Gm2McK2GaPDrhS5sX6e1F5vJuaaUKImw
	qgNZCRR25v5EBBJdbZlBJlM7eW9a9jDXFNa3/ALuvGoMx71cEAL/KcC25jIzJOdxuTXj3Hw8SBa
	OzDDx9Et8W1gMQ4PdmYFuiCswRLRa0lG8G8PKk3OgDCLfIXLaMG6NFDmv9PoKQ1VplesTl5FxfA
	Y6PobmZbFh2mq2Ou6OgAfWnQD+aZ/nuhLT89cfGsfxTu6ijm/dUCB4sZyjYF8vACKFd3BDCrfxe
	9VlxQebbprnk+MYPpcIJqa2xTzFFqBJDNujN7ZY/ps6ruVvHTuNyVi32TM6IRHIvpLSTOnlCwP+
	fwg5sh5OqIk2PMj8=
X-Received: by 2002:a05:620a:630e:10b0:939:f978:c1ab with SMTP id af79cd13be357-939f978c3b4mr135520985a.4.1789133732636;
        Fri, 11 Sep 2026 06:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:630e:10b0:939:f978:c1ab with SMTP id af79cd13be357-939f978c3b4mr135511385a.4.1789133732044;
        Fri, 11 Sep 2026 06:35:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm6290623f8f.27.2026.09.11.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:35:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:35:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Enable SD card for Shikra EVK
Message-ID: <e3h3volimyab5h6nov4bzassb6qki72c3wev3h7yyaxkdn4gfg@l2f53ch34aru>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX1RUgD8fxJhN6
 txZxf2+XCTvAxdL5fd8k9t1DRKoCplkqxwZK9bUwVnU7aM080BH+q/Doqsiy0udenJrMFVV4VUG
 gLH+nR2ZzOpi2n9pWkC0lYUG/hAjZh8=
X-Proofpoint-GUID: In1OYSzUa_dRc7Duuq8N403JMwd2ZOWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX9/gua+9dqU8R
 f17WzOoYMFgEYnMZVtaYvM49zDtoDiTmKbvw6Y+vVdWPeS2bXxmwjhlYKLE8eMmJJ4cPTtlLXeZ
 mpKdNxaeHJWSibnr5VRW1s1bm/8o5D8Ju1QGIE+J5aEvDLXEOaeLvzeAG6l/h+7jur3Zzm5xmYV
 wDNnx09MtFWgnkCqWr4XQQNf8CT2MugFm+vuEFKbd6TeydLZiD/Viis23rYYf78mG6Svyd4TNLk
 oyrwwmITCRVKKsPb1oC3Efn9rL/Ko2mrJeqRsJ6V1Uo8Fq4m4cdM//27dFsxqupFVY5mu0QG6IO
 v1JwWPSMiX2OWZb3pqQxDc8mHvtDsVtk+WosJNyKGKXiwVsz15P45EqkkVB6xbC3Niv03Kvw5su
 M3gSQiAw0h39HLROOuBxtrNGiWDATNxyRxy3JSapspRxWac64S+zpvTlP3DTH5kho7k48AiRlyZ
 9NpcanqfXqnnLCeyExg==
X-Proofpoint-ORIG-GUID: In1OYSzUa_dRc7Duuq8N403JMwd2ZOWv
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa403a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vBACkDl9X50tgIqftl8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110189

On 26-09-11 15:09:32, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
