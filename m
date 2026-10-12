Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4B4FB9A4
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842252; cv=none; b=uzchQdNOxOb+FRouD0qL6SEwxVYh7woUHEkdjzb2qLeqteN2QGizoMDJwt9pNZ+IvRdl19i9o8Cdr3fRWYPXwUiQIOd4wxakqT9gvSz8/eb+sUr/opeYD5odauQeO+D227RlCvC9VzS4P/aMByGtzO9ofh+A4ady2f+9gfTF1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842252; c=relaxed/simple;
	bh=P6jfC0A0EmG/xyfQcbws1efUz2wOkhVgwoKrGtJHlrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0eYEsCdAtlc20wh68+dlOaSq/KaNeIHxikYoKOcyjCjVF6ljh2R5KKOzKBzxz+fWCdJaiJQv5LW/4EJ+0kzO5+wJZW5ERlXYr5DI6ztmKEGdUNcpahZE25B/kas3Ce+ore0Ht9C8hCPTwnJCsCvc3fwDP8AZTRtlAbMlkRV2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obR9ibNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWUYo6XT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obR9ibNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWUYo6XT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJMoSM144145
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GrCqiMFgsWuCjxp/MP+SWZYLaDIyfVl/iFjpkLpo+U=; b=obR9ibNyB7rgLaoF
	z62XLJbC4hYkUvwqdYBGhigKWvYaC3RH7SfggKa/mhO1WR8ruWHX9p/UrdNE6gmb
	k+xC6Yf8Lx2KCMQAZQFggHsx7fE+0SWtZLGg3MBO0K6g5Yt5PBdoh8u4Mb6RzMxX
	jxggXFZkmdpcJZ37AEIFhOJwPR0hW1xQE3X7ovKkfnp7jIaRO7VlPpYLx0pCwaXe
	c9Wr3R3S1Vrgup8sUxj2irHlKBxUXAnb8lZLnInekWjn6H9DcFLmJWKNiStb+MIN
	b1DPzWFBLtYMpwyRZP83VD7U+TP5lyqcfMc+k/e24JDQIhm2xrpBn1y6d68EIu7i
	K8lulA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdrayjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:57:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso465423785a.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791842247; x=1792447047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GrCqiMFgsWuCjxp/MP+SWZYLaDIyfVl/iFjpkLpo+U=;
        b=JWUYo6XTP5qUSpsPyZ33sBkeH7ETgktuCJ5RdqHkvgG/siqD9Xe5et28drIOuKcMtB
         cIFBwbSPkOlgGmFI4nR03WLFTr9sEk9qDjAXGvtCHnRnVpF2qyNhWdqR3n1xg0I/WXmO
         pyCRZqK6Wtoz/3ibiO22NdNDipH5+jghncooUotwKjta5v/f5xcMGG8Re0LuzOqHAcWp
         Ra1ZrzzjNen5nkL8fcCMcLyXVaXvvbfouq6yUJw6tBo7C4ey8upFUSee0Ap/zYQh/87z
         DthBzF+wjsfVCfevUynl2hHqrfOmz3e4bEQt/I2q2vyz143vtJsnCLiWpf7FLqDLSKs/
         nT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842247; x=1792447047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GrCqiMFgsWuCjxp/MP+SWZYLaDIyfVl/iFjpkLpo+U=;
        b=IEfEJlBjsdu9Nytw8weatbb+v0wygCK9DAhQVpEBxS6OSumJg/J45N4KLXnKYD2Hvk
         xFhmf3AJBBEx0MC6rx3JQExAInQCkJDLGcnHDtn45XmpC4mC+7+yFTvqlWgI39gCrh0P
         lFUhVgUgcyqKbjkcRy3PKLu9m/s5vA1tkd7eL+z7mFz8J4vSL4+jDVF4jNPzRyy+wf2+
         TIrjYzIEvFn0fV5vg1zKfe5mkrTiEnmi0xoSft0HpU+idkekuNsEPB1tCsQCqKE1LyVk
         C5SZU3uXLDRCVFolj8bQQXgwHam0TdtVqYY7pLP9NkbSULyeLB++uyPbKaMW6jbbPbHQ
         raZA==
X-Forwarded-Encrypted: i=1; AKwUvByiBvVQGCjslf+fzOUdSlVGESZ4WhFFs2sboTm1nEIXMvSn+tVkgntJcVAO2l//FguC+GwCJmGjijQt@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2S45/VQ46EejbH3tor9PKtcpP7YLX/98cPN2oRbADSb/c7HGq
	ne+8AHU8Ro3/jAuezmGJCMscSyQZccTzkNyx9rQy7Xb+CF9G0Caz2q7Fz/vOB9jXTyAVuRGa8B8
	hxTNYUt4uBZliMXBOK1GNCT+60zk4IDQnnM4I6hbrQgR2R3ca1orCZKq53zCRF4pq2We293dyew
	0=
X-Gm-Gg: AYBFou1cpGSmCsc0Rs7HxW5YPFFAMnb0syfbyA/inUqNmviETGby+aWCial/VQaq8X2
	0WIPPdye1DcZM8ba/VEHdO1+G/3vPazGhVYBmkoaMeKa2YvCydM0oO9B23TWlERPBQjeznnCSKF
	wCIgno2WT7QTw1pYhP+KNI0hEX/cBW5jtKTHgnXLrbA38cTVhp4Io8YH+KMuTXTsYpEi0g43wyH
	6+oQNwWRFvuvhEEaoMIoc0B4b0z3PhzAL3475xKQygTfjqN1DpRML9ITbcWmiDxwTLdjFIuGZWF
	8VMxJIzcWmujT5Csqoi1NcLN3CFieY2JkiKk0X6FPHE3RTNAaYkQUNBoHmIYN7cQYy0zkZH87pk
	R23Iy3QthzjXYRZw9HXhgsPVxCS1NYvaqGzgpdxd5YhpBL4+aNpG2yuZ/x5HwWA==
X-Received: by 2002:a05:620a:4149:b0:93e:d051:8f19 with SMTP id af79cd13be357-93ed051b7e3mr1187563285a.40.1791842246766;
        Mon, 12 Oct 2026 14:57:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:93e:d051:8f19 with SMTP id af79cd13be357-93ed051b7e3mr1187559685a.40.1791842246244;
        Mon, 12 Oct 2026 14:57:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm490389045e9.8.2026.10.12.14.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:57:25 -0700 (PDT)
Message-ID: <66a8df16-01c5-4653-9fb5-7d746f03f782@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:57:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] thermal/drivers/loongson2: Fix negative
 temperature conversion in set_trips
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfXwt+rID6ibf9m
 HurDt5kcixvxp2551bqcR4DYt94hhU89z/FutiwSd7zZCd7i04ikdwBwJpK5z3pZKiASnDyRYkO
 bQhzlgVDecSXPRdqXhKNAn0/osG9ATbqzlY7DihEARbVUQfH9PGpY+TYmQAT9qcK2gBH9XGT54A
 3BbwD9rPhwRyxuV4abxONTcYiMH78k7wrCR8NPuxrbr/xxY+yRtk/bsksqV5NtupybBDaHVKHVB
 lT2fSSvHQU24KsJpsNybWf0tOKzvpIcqq6RB9WoN8y3RJXMMv2ns3wHNm9/vn4OuRzGMK3zRFGb
 y4GidLQSyFOcPrl6AsgpZU+Yzr6BikJY+heYSxKtGq6gl0qYI3rMXHap21ittVWPK0hHIUKZPdK
 m2QO69TXuE8VppsqZMvlyXgNNaQzDSAjRdDxMU3P0EU32BgzubsnOLZO4DV39jXR3U4J0CSAPyA
 VNnefw6WSPNLTdb8xoQ==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd57c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=i-ReG1_fGx0deHkufOwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX7ylCYwK+em/x
 eAnNfiR4an70eWkvuIPLn40TfZxo5/tunJfYAppzgFAvdqIVSAxn2c96lBxbX92OVQQLRumvjOJ
 XakKLSFS39pkabJ2YeLQgAHB0SiuAjI=
X-Proofpoint-ORIG-GUID: qLYikf8N1BImNHZnklw8FHelEK0O5H04
X-Proofpoint-GUID: qLYikf8N1BImNHZnklw8FHelEK0O5H04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120087

On 10/9/26 04:57, Binbin Zhou wrote:
> The `MILLI` is defined as an unsigned long constant. When the
> temperatures passed to loongson2_thermal_set_trips() are negative, the
> expression `low / MILLI` triggers implicit conversion of the signed
> operand to unsigned long, and the division is then carried out in
> unsigned arithmetic.
> 
> For example, with a low trip of -40000 (milli-degree Celsius):
> 
>      -40000 / 1000UL = 18446744073709511   /* unsigned long */
> 
> After truncation to the 32-bit register field this becomes
> 1271310379, instead of the expected 60 (i.e. -40 + HECTO). Writing such
> bogus value into the trip register leaves most of the upper bits set,
> which may hit status/trigger bits and cause spurious thermal interrupts.
> 
> Fix this by explicitly casting MILLI to int so that the division is
> performed in signed arithmetic.
> 
> Cc: stable@vger.kernel.org
> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/thermal/loongson2_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
> index 4d40fc706a53..f5ff0cac1442 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -108,7 +108,7 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
>   {
>   	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
>   
> -	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
> +	return loongson2_thermal_set(data, low / (int)MILLI, high / (int)MILLI, true);

What about using MILLIDEGREE_PER_DEGREE ?

>   }
>   
>   static const struct thermal_zone_device_ops loongson2_2k1000_of_thermal_ops = {

