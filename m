Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F51261B70
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152562; cv=none; b=Vc7510EvkjjpS3JfsArMRi6Y0dgjATdoLiwq/42s+CdRRw3Kay/XvyEdv6guGJroizdmflAAhvbwXFKOVvNTUim8gjezvs27Dofwzbya/8qELI45qme37CkbU9LN3bUwdkIPsncTiyvoVJ8+qmr8tkffwhSCZi6rdqHfmph5Rz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152562; c=relaxed/simple;
	bh=q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFJ/jqfVdMurzvj1EVdM1snUs1X0HmGFJuRXbtaaJBmHU+0PWWLriWdqHGuosqIazGIqvK0hFcalrTvXKfHaZimxMpYpazQsbnNHNoabbJbiU6JrGUbEsS8c9YoiscCN/LASw5g7BpcAfzJd7+lHPP+f5JYzGDkOQ8HlpkmtV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeoDfsWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUPP82fp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeoDfsWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUPP82fp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbVU1566929
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=; b=SeoDfsWpQqPfDirM
	p/IZttyCiCuF3ZBAyuYxI9LnuMjjQySN8vQCG1axwLEPAcxywK6Cyoma25pQY6lG
	spCKVpQcMZKH8sfnX8xM9e3ODVPD71xH9KXKATciAAD3Er9Nszl9TdSzP7M1wuB0
	QGyV6JXzKvZVxfvbqC40+duCV4yZEJXjW1pQK3GByPzES5HaTZYVptaBaqiso5YY
	cbUQJcom7OKc8twKPLSVqGx5XN3UsQjhiafj1imPJ1NfHzRV1ahMVrjzBFNQ8Oty
	FrCYPAhXY1ASoQSKU8fQD/tGhS6e8/nVJHysezh1dkMyS78BTvoLvjQQYn2Jb1NV
	FdHJ6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa0hgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:15:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so3747611cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152554; x=1787757354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=;
        b=ZUPP82fpij0hc/phu7o3J6KBpJ98wxXTSCVEk1ayDvpxIxyhX61mE6jviLznFlXrxP
         EHo0k7OlX9hclOCOi8gfdlgvRzCWMZEgVq2Hy2zZgAaDxHjZ3Jp51rwo9QibNvY1+5OW
         9w/SHy3F16SJ6s1s+w79NstoUrRYLzqQl+Ndf4fTSujwErNSNV2adPgLBUkykCC0f+N3
         jEfURFQwz9LaYRuCpkBqoFm5GM55I90EVIyvSRsbPGK1WGPzv0yhdqy1VltC0mlsj3Vc
         Yb7fGmwKqiRpKFO8m8sU2u8NOyizE28YYBauUtwxdT7O/yY/KL6nFywiJmQ+mrdZldfE
         FX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152554; x=1787757354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=;
        b=XcJa4lYfLDNMOnD9RbrOmtEqczDJTqFbsbUpzw5G9dKZugoROn6iDAC88cCdlSZeOA
         Y4h3KZRmRvPhlVOiD28uozCKupC/QRRNNew6oloy0fNCo/LIFTtDZ1BkHS9fUCFNdknP
         QkaMGvMwmdxWy9ltN/K2BLkQ8zGiIWUgpoJ1DOxvwq4RafKcUa8p+S9NuipOthE5XULU
         5NqQUFrn1FL0ynNhGHOp8jXCFYS/grSrvN492Z1p6ywoLxhykKFzwzfHVFM2wjSh4sZ4
         91gxcStzvBr2kUbVmVdoKRHVyOsS8TDjciCIPLW98EVopE2x7zLvNElCyCJUASOXtyg+
         wVRg==
X-Forwarded-Encrypted: i=1; AHgh+RqZIyaEeLLwufZkEECw3lU6oHfv+CmQaVymb+1PxnjLVqF57ZFIVldW4O7FCXCidyvU6QT/dZQI7UvA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KdhtVbt8RRbz8qYoDQhpsP87frxsRzj0aXGTSGJf1IDuKNyp
	r8FzWBDIx8JqGDP9Rp6d4g+sUS5pgrQLKDsgk/lRDIrmPojVKoB2+S99QeUOBFG66nyUhzYFuW6
	7dg7mT63lcnuMbgxnC1F6PALxpy6nAaKa+q2dr8rExYlvT4kw4FzbYTVZeH4zs0FM
X-Gm-Gg: AR+sD10fXD+xk2c3BWLmIy59Xu1Tol5NYBKPs1hu2g31fhprZ3KtcKgPLjXW/jxBPa1
	K6JIWur25IifdPq2x23K91nCgMEj+c0tmWcpdjaOIuVXehyWZEyKRZphJyyHMi+wNjnZ8fy3+w/
	E7BPJV0IkvOFeW4zX7v/8V8nv4HAMuarY5knyFjG0pNQZt3kybfedn+LwXsZjcvSluz2IK6Gys5
	m+bypvOdCp0PJkvbjqm/49V+eKp7JAeIfGnuJFUZetBqg1wHpgjYaJTI3krsGlzPbgoSd7j5Tr+
	Kh1UDwiYogJ0F8UtH3zh57XTkLAeZbA3A0aVzGt/B3dd3Te+n39GI/tsGURLc/V0JV5KWBLFW4o
	5ufAt7/lBTnHJ9ZCmIKbdbLdQ
X-Received: by 2002:ac8:7f84:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52dd57bc734mr36257131cf.1.1787152554107;
        Wed, 19 Aug 2026 08:15:54 -0700 (PDT)
X-Received: by 2002:ac8:7f84:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52dd57bc734mr36256521cf.1.1787152553666;
        Wed, 19 Aug 2026 08:15:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c8de334sm94990666b.5.2026.08.19.08.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:15:52 -0700 (PDT)
Message-ID: <10495d48-5add-45b3-a398-5e1c9d09b9b4@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:15:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
 <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85c8ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yRxRTG7gzZ9evFqw8iwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VL11yoeSPTK7ZNLvkEHd30g7PeicI-Fa
X-Proofpoint-ORIG-GUID: VL11yoeSPTK7ZNLvkEHd30g7PeicI-Fa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX3v8xTyTQpgoC
 ZY4PMjVr2+tg9Ce2qGyDA0pcB1Ghio7MIBLWYnKTqYDJw0G4+70OZi3yiNKhUmK8g8pBRvxcwCc
 LS9qbxVRPxcd62yjOKY/Scgc4jRXIkw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX8a6gua5n10g4
 CBz29UiH6y5mOb4QJeHqCOh557v3l4Q30PviFnyzwslQLamBmEr3QfFpK34iWmM+FNDHl+Skjuk
 R1z2SpuJ3MOkk+YQ/uQun/OYABaGtUkxkefkDPXqN7TkzO22ruRbsTWOMn1o9v+9N+XAH9mX05l
 pkpZdBBtBhCr4EbA4mKx7T0KoFbh34iDkV/T8r0sXYcPkxGYEBMf/ifiN1k5mnNhclN7eVUO/jQ
 g6TkSKnFt0ctjVf0bKRJODw30DNAnUcC6nc7PZ5fHesK6l0RuAQ1b7uXZFupnJ+5IAGscTXajB1
 +3+QkcmOeqLouHh0mwSvwKb9CsMOXtcMhS5+bREkYxwErTcisJsIxOa010d81wB2kjM2rvXU2hm
 IgWVe6MoI0YqV597I8aAlfsFfxaDk3+ww8bmTaWeRuCLNLwZ18zVjgt9NjxuAAzoXxwdd0Njgbx
 ZbAdwLCXULnOibXuo2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 8/10/26 10:54 AM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1
> (cpu6-cpu11). The surviving cluster is re-added in the cpu-map as
> cluster0, since the kernel stops scanning at the first missing clusterN
> index. cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain
> 1 is no longer present.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
