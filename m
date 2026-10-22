Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656815;
	b=4B7zjBjdTqblafGH1bXVvx7aAEEP421z9HFNb3VnnXLZSnmHL339lQKD8fCsfaK73xgB
	 APxJMwjh2uOUdYUrkUj/QX9ZVxDrpXvssTvBMEOYGlHU57UH1/bxTk4mnLS/EWvgRXDf0
	 8iHVBfwj++N4YZxY4PY8h5uWlnwF1QzRtAohfgmI5Gj0Kke0Q9vppXIoVoc1thM0SZ3B6
	 iwFnsptZfZ0Srz1nn2zhrv0sfJPcUxIiMxreyAR8hjhtT5Gepcu4ZfqvMzpYjN24gKuwZ
	 UWaNnaiON0stggLXakvIT8eQGsVVic7KWp5wpnch+6mDLyAAb47Gc0rrSb0Vn2cDNoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
	b=j93a5WZzbWuSjdezV6sUQu4HJhA0OBrc/pil8XLEOpN/CZVPS5zQa7whdedLFBvTquGN
	 KL8wrzmnFB9z6BGRPgaUHdgC4at5D6B7UEeLyIBJRsy2/u2tPR9lIFn1HkeNi0oLqlDnI
	 Hd0ZP6VD/Cf5rnZoSEQ3BPhFIW6YvkzV7gQgeVa7sZaWMYzNmiDsVt9kk3KfGdWzhxhMF
	 8TpVB/WcFRig2xo5ET3lvdjTGcKDe50s3GHIVYFiAe+/r6enLdpdj4yRJ8BwNdk9R0rsx
	 rfwveVQjNdXrrlCCkIQEidWkaaeBQdNL1Whjvu+0Vb4IEcMX+6wlczUqjgRWPS+Nj4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE+TvT8Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B467B606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B467B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE+TvT8Z
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705Hg1995922
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=; b=Os5qUXmIQbX3CzGJ
	FX1mxLp/kv1/u7jRnXp0HWIH6Ut24Traikrrr1Wvf5N/dydrT9MBF05BxfA6eQ0h
	fXRC6bC1bLHwGkT/z0Q6D/zCarbOttK/qmEEMmwz86q3YFE08QMvFQwbFCRrux5j
	izmxjzZntCi/J02ZPgKucRJ8mXPLESo+3gFuuHc85zZe6GhWxvxjJEZsjr34tXId
	/x6HpxgfaVbP7sEjE8Iswl42t7LEs1GLlD9CDrJQH1C827cvEZL5ce1vQ4fU5HEt
	+XSIf9q+uD4OhoTjnFMLzsiZuud2xEoZWBALdZFl24JCsgWzPBWgr/IlNzcQvYhb
	JImm3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsc61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:13:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso3726091cf.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656813; x=1793261613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=EE+TvT8ZP6EKprN1mWdt0LJpE1dYUwjTDnVfLveq3pDGrKEDyC0XxmF2d7csWEtPxr
         XgPSKlYrnvFqzODXJsh4JhwMFjkjf2bskamh6hTPfo21eU0pU2lNGJ0hvm9BAFxoyIHV
         srOv7ACxwrvac69E2//+1yBLU+WyNDHo4MQUDEzgQayJVui0p3M/Uu5CBpsjHiDM3i0k
         lpIY/WAlhuFcSVx0APmr1tG6oKr54tyVZsuIApbvXrekv1DGZWho7vGKIU4DLyaUG/Jq
         Wh7kp4UhhqpRXO66luDx3WVKF+qI80CE/YiBFv2qd8cQY4H+tlL9octQyOpR8Txvcw1B
         RRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656813; x=1793261613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=bYlSSiXlI/SjFY0RtMMrgpEdqrhvB1ELeTIHnZGHw1PLhKbISYFP6OCMbD8N9tT8qq
         dr2T6Yy6T1fXH7PDk8hmNqPXbc1JI7N6vabCCNaYA5FYchZ16vKYsUzIIvcjj6klk/Wl
         f91/Z0OD4hBzTQrwuWYRi7kNKeUno7VCP8U/f8LhHMMnZdsOblKcYLj7KTPT7qzPHHXj
         Ookp1/InFJujxtLgOfx1bosUIXVBIqrjCZ9l6kTZ9gvECRf4asqKVP6q3g/o+Z0IhCHF
         r70ddmZco2W3L7cq3d5OzaCiW6GRvQChi4fdaFr0/qM6tUr3ida8ZFuBbx0VCFw1pDLz
         iilg==
X-Forwarded-Encrypted: i=1; AKwUvByBd7hSxPYzSm8sU8pB7Orkfh2AiDC9wXqOJpDqZIdesIcvxrbT9Kso8FKgle6iIqeI+59olAARZVZM@vger.kernel.org
X-Gm-Message-State: AFq9FYKt+vpTFA1mMs158xWKFudIvW7xYfIqO0uMJ1stNrEGEeEx3pBZ
	9P1obtLC57uUnTwlvTYXZLzJ/AHqBFVT0Hx2SM/aj90PqGODt/mAdaLuLLUVA/OHK9Osb8pDbH0
	W6gMJiaOw1AoekK8MIy5Rk7xGhZANrNygV5IIY8b0BCjyqVEfIfIeypUJzDWy2YgV
X-Gm-Gg: AYBFou3pfmZFVHHu4SH3iHQmpM5CMocGTJSkve++7id9f6A10/UPI2mdz6TqGHw1zqm
	/InF4Wo7oteXHn5o4EkH7jT2tf8MyOaobrMg5rjiMifrBtaAddTU5L8LAMwjpnEqEJDNDyMaJT8
	irwF34EZHbRnnPCnV4Omk+y8OWF9YWAQQPFkvO3fVyriod3O/m2DdBCEoFFWrn3qXVaxzTRVa4F
	dMpcLj39gofZbzuvFslngOfI4lKYISdWE1shxmdnZFdeEhMJWWtVv9FdtHV+riuVWUmz6klxEmz
	gy5sGMP6/Xm5Jc9xKUfaiYx28uTkhsYBJta38TW8rUTxd7FIjpA5pBLd1cu7TkuzaKO3Fplevln
	+yLvgtK21g+yiR+aH/u55+g==
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255521cf.4.1792656813186;
        Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255271cf.4.1792656812768;
        Thu, 22 Oct 2026 01:13:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e6e33sm77669266b.75.2026.10.22.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:13:31 -0700 (PDT)
Message-ID: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:13:29 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0olmDjG2BGxQaqdyw-1d0CMAZmMIIZ0I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX05PGkoI6WTUy
 xt34zfTsQZPNM5aQufDeWpCNEHS1fLIFPdj95mTgqokVgNq7cpC/wKh1vmefcF/fIRv9Yr/hS3I
 ZOEAj9UgYsCJrN42splkkf0ThP1I1GU=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9c5ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SyOgNX5fRjsOj9ann1gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0olmDjG2BGxQaqdyw-1d0CMAZmMIIZ0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX6kb/fO+1ey+m
 yu0zXGnStuqJu2uh8/hYQ5r6priUXRYk8Qn5obDDgdZVHJKDHfJzn4ka1K5itkydY1qBkyoWO4C
 sx1f8PlmzeKBx1p7j3IuGk79ZQynsb1lYX+H9x6w9wdC7PaJ4su7c4vEGyRw/jTy/d4AUK8TmPi
 87dJv6JwJeVaUJLP2cAZNUmiZ43waRv1Co1hwg4qwnJFMZYQBuT38erwX8imMixWAmFY8h9Qegf
 fer+/vQ/F11WxE2L1R9BwM+JiAUTlx+jnV+DXycHXSsgCEImpdG1oLuJqrlqh03hx2qL20hChlu
 W7ErnbdzMkvHnbdIH84u+Zg2oZc2d56Y1LNHxNi7CU1a5hGQdbJYMQiZMnCLG+3yQIJJcSn68IL
 t0mU21fg/f42rKtYDvgv6K2fp1gxBFzg0cHJXy/Xcj0eVw6MwF4wBmcdpJpMQYoO8+s5D1M/HPc
 lp2ckLxFMupONRoJblg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> LT9611UXD is connected through I2C4, with reset and interrupt connected
> to tlmm GPIO76 and GPIO85.

[...]


> +&mdss_dsi0 {
> +	panel@0 {
> +		status = "disabled";
> +	};
> +};

Please refer to the panel by its label directly

Konrad
