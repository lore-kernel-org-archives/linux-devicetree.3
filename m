Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27F3AA1A8
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955556; cv=none; b=AeWtJpr8galfbluel+75CbMbwQSIFmccLzfy8K9+zhsTFmwC4eSK1FUA5yv/moC224VknIgr0vvdIBmop/KmiPibK/h3zcWImPZxEOy55iFSgBFuZmDX1FTzu8E4jl6TrdEInLrvE8EZI0dp9zREvrDm/NyoGE5Enp4HL4W8fig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955556; c=relaxed/simple;
	bh=S8WYJIegKzqxKEqLKgVZrlVshD6nky7D1THTCIKqmUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEhSpb1HDdigmyr9gfjnN3WJPMkShp37XscicF9FKrgc+3KxWe84+RAwVqo2CykC1egMkwzrvdjMgRVUth3AxJFrqRq+FPaFbFMnTzDqjoEeHBNnJGitxkSqpioe+btSp7b9q+am0XgQsJd2nY8iqSQA5k9TYsp4KdJ2gmpR+P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXJhfNax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+i6bGL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXJhfNax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+i6bGL9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7olaR430858
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmaWKZZFLKiiY6+iwMb1H/NOyseBVqgFFD5Szt08KwE=; b=aXJhfNaxdLCsDxnU
	mdg26J7N/Vt6//oMdzPefP/nsUr9tprlOS62MgOH1+WulkEBY/QCnUoDSZkb4Q9z
	XHs+CiM8r2AU6GBDKsQyZYEdl88Net6Cn6mrPulItSuHwSIPNWxgMiqOyTMhhebC
	vxLVuEHhLm1g6KxeaDABsaIiV4Vf3xfeD73jKem8MvKEsOUxJXuiAqFMs7Z3AI/1
	fYtcKyxSj2A6Qi+VO0Ld1w253dUYBdJvI5qqo96NcLaXWukgj5lCCJ5E6SjokHwn
	Kuvhj6feP/jzSFXIr076tPLLI8ca6jfq9S3hxOWUJkm9xLBbRaEeP6XYIvZ9VAxx
	7ejDsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfj4fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:12:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a18178713cso7360786d6.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774955553; x=1775560353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmaWKZZFLKiiY6+iwMb1H/NOyseBVqgFFD5Szt08KwE=;
        b=W+i6bGL9JkrsqSEDFIQAwCDKRIC1YA90sXvG9ndQkmX1bFs0w0k+4n6jZNPpTwil93
         ZddQ4P3XoXXXgcGNcT0aGJfeesPMTU0TwQOX5GllPgbP6VM1y4xow3pdXpGQg36elh5K
         ktP11cIxEK+CGzEl0t3OcTYMdph2k8JL/ReWQmh8GcXfeHesCYzeCE3HeK/TRaRzRuqi
         RRze+m5awDKRiFDCy1seJ4LZVtPCH3b06w0wkFbEPy/RT7v5FqxvVtB1e7/s5Qtv0KES
         2X/e+ooGWfN6i4aCGslYDSIRGLmwq2eS4u9tgTUriAz7L2CGXV4zMAIBPPeVip1WY6Y5
         Lilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955553; x=1775560353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmaWKZZFLKiiY6+iwMb1H/NOyseBVqgFFD5Szt08KwE=;
        b=B/U01Tn1F6lSPFonHsghjCeqBTHwGBvql2wgtMLl8ANFgX1SFyZMEj5nMgE93vySAy
         g/IIGtAQ/5LadF+kldkaipiv+aXVlXC9uyr2f+9dMiNsLRZSh/ncqlA6C1qJd+VSbibp
         PfcBCbCNDWTZzK8j+912DzbX5xAHZzAgccQeUrWvtr39LJv2+8qXgE7NkVX7oS+fqst1
         bxn7x+Nyt57DKlWo4F8faJnPuMfr91AXDhr1HNVCb+ghco7RQJ1nVVx6orI4wfnIf9L8
         G8K0SalH+RsQt1uL6KAeAy14N/9TClEjUeY7p6VP54bJn5UZdpJPyjdqpsGFOsr+Q1N1
         34kA==
X-Forwarded-Encrypted: i=1; AJvYcCU7shwY5RCJU1uz81Q0tMLtJqLlYpdcCiC+0wQD4ZyGlbDZHuocBFogSrtrkhKpIEuYF/l3VfqYeJx5@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7/iqJ81lI3v1IzuqnYwmy5yZ7FPQ4gucVw7GI+P5Um4dXUm7
	pm2ZEMjdAec8s/XU+5hMHvFaZEkDM4ZdL7Vcgt2PtXT8RoGl61qYAbRqr0/cKS83us0u4KInJLr
	Cw1ClNSfRdJDNHswijh1dKQzkH0XPg5x1inttFr2W933EDMpB0jlzunQcLaXyfXNf
X-Gm-Gg: ATEYQzyV2N08TtN4DV4EPWc0k4QJnDVUg6IKk1HNhPgDdJef5zM7s5fohtbd7PXRXP6
	ls3fNOekAJsPzhM9si6WsD21gQPZ3BwNiFvIYy2vlE4oP00tsyaVII5nE9PpBJN73cqVLuQ+x4u
	htVe/pWhnDv60pmykFqoIbwS7SEP8vSG7fUc1dn7mDQdsmG5gOlteMXL/ENb3V6II+Ro3lSiXgv
	Sjoi5535ZmETiGF/BntXZeo+0SyyczzdI2HGNjevB7RvaImhZFkufblW1isBqxbAyBISeYAlrQU
	Q29MVSYWClzA2O/7i1+vxpACvLhKj1kYk6dXCIbKSKuvoDqzUV4dkeRgBk7mn3vHlruBi8x5H+1
	CtbKAWnB8U6PwWp0bqWAD6KjFy1yuf4HWhj3eNfvHDBoBQoCULEAkwCQQxwjO3ogFB7Lq5wiWvk
	OdWpE=
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1460637285a.0.1774955553408;
        Tue, 31 Mar 2026 04:12:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1460634785a.0.1774955552916;
        Tue, 31 Mar 2026 04:12:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm1875977a12.25.2026.03.31.04.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:12:31 -0700 (PDT)
Message-ID: <82bbe04a-b853-4dfb-a937-e1db643a4403@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:12:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-3-d8a251be20c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-3-d8a251be20c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cbac22 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZJD1sKBUCcyTPMDnx20A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNyBTYWx0ZWRfX9bQUwB8j6xei
 A0wMJFS6fjZw6FeArJpmwhFzCmiAMqNgPlGKgQuxyEm1rizQJKFvcpj4iChGNaobZbkytcGChZ6
 jm2yJl0nft7MqtycqbRC9tnfo8B1DSSHlhxl6ddIId5JdnYKk3wOCC+u6NXNUYNqpxyxrtUDCpr
 I+5P6KP5gUwGFdhDF/MwSz4o47nMb+w+YKun9V/VX5CgUBcG/L2IIoMtIO0kdJAm3yZijS4af3Z
 Ck/vR/tw/sZU5ipb9n9rSb2v1AQcC0A7rbMXL2meyp+XzJ5jUU6cs/9JwhUfLy+XpCGsPUU+g1+
 3dkn/95JIGJkB1avVR54x3GENqcji4L05CRHqD+fAmSXM9ybFqHljmFJxwBfckBwOBb/hwOk7rI
 qI8NaxU7zx9JjbHp9NF+bgUD6VuS9mqJWyJyQFdNSY16b/r2Je8J4sj4FPMcJdMhihch6HIX3P8
 hHcG8kkGhwnXOwJG8Mw==
X-Proofpoint-GUID: iEiVakkgmFIEPEJ7Y9MkesX9V8VJy2LD
X-Proofpoint-ORIG-GUID: iEiVakkgmFIEPEJ7Y9MkesX9V8VJy2LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310107

On 3/31/26 12:37 PM, Abel Vesa wrote:
> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> 
> Describe the port and repeater, and enable the USB controller and PHYs.
> 
> Also specify the ADSP firmware and enable the remoteproc.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +&usb {
> +	dr_mode = "otg";

That's the default if dr_mode is absent, drop 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
