Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E739281525
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008993; cv=none; b=RRKrqWVWV7foT5nhR8oi5QuIu2snUfzAkOQjoFPSgUp/qJD9hjnOAiI1HaUItOqXDdoANR0VptlcCinENJFpDQd55N/nCWNcohfWVswB7rbi8uNF/7yT1TB6H9jL03fRgqct63eWwP9Q5fIBQ7vCKLD31Zion5mbxTa+BAlWxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008993; c=relaxed/simple;
	bh=FyzPBAHmnVYFtHiMn2cLnHG2YhPDqr3a55ITi8nzd+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra0Z+5pU49XPA4ABsx1VU52bteV+Uc8OMO9WBM90jPPBrrSE1MTjhzJddyneBzjiMMVZDzrNz5uxhUVcomb0RiKvLNRUc6NK3XbohJNAo/z7eXFmWRS9orFKk7tUVujaXL0Ymr4RPecn1VtnkTQ+j1gabFWDNsLv5gkCVTE+AEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joa+CjY9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1YG2BEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joa+CjY9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1YG2BEZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38VVg3441538
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqf5IARV4VqE33qU7795ksc4HZHjnF6QVJ86C5gf5vE=; b=joa+CjY9C8+dKtSC
	/G8vjKawYgY4tKvujz1F7spLQRaseeldx4iFtOpreLhanKaIbwg3XUhm8upsxT27
	IrcabO+qvAVDCED6W0XCpebtK0s8/CYPFebaxqT7/5XSQaT0FyrCLHajhgC+ga5+
	oXgt7wDWbcPl40YWXAs0VCxbukfd4jBkJ03NLALSeYjHHLQ5/GM/Skb1PG6J9kYu
	Vjj+DhYDQyRjH7/sg2Nq0UjOH4O7LFynon6WpJ3AWgBL6Xhm6+W75wTWBihanDKr
	5eD4wnzBQ3F/6+iED/4HkqfFRpOj/MisPfA6bQxfDIskq1Ybj8Vb0Tn8lWTDgjFJ
	nNieYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48rj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:03:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso6956623a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008991; x=1784613791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqf5IARV4VqE33qU7795ksc4HZHjnF6QVJ86C5gf5vE=;
        b=J1YG2BEZTCr+pebn7ioHMRYTkXc3xtxuiK068leJBT8PUbddEYlzSP4Z/aRmOEW/4B
         DJdZz+Ga9yf2MAadnNWOlXM4u5x4pbAPnZNRTmkvnqbCVuCrjKerysDA4b9oxwW1SGP+
         bEGvME7aOf+LDDjY/Xr4m0kDZPNa5qzpt8EuOwMm/bn7soZLXJOPFqDGmcNHahHrcBHj
         u26FxgHpDVa4CesxJh2XNCg5/K3hSsGN/vP+bMzFMjfE2ep0AeRGyGp3fsG1Zgc4fRqX
         UZCkemaNknZvT6+K3WxfBAWJEIBRu3EOYe829iCwsDIOBR1owCwcZXllgAt9Q/kczhCF
         ziUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008991; x=1784613791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqf5IARV4VqE33qU7795ksc4HZHjnF6QVJ86C5gf5vE=;
        b=OpApy9045AMbWhjjEHTrZ0WVGtUDaM8EyNiTHPGZGNVpRiRXFGXGLGmESS6n1krNHf
         Wb5U823ODtWwK9L8pvlRePErBC/FzDJRLM3q/VzDZUEKpJhGQu5TZ+XqYncw0rFOAPUb
         KEew94iUXrFVWR1yB9NXS2hlXdBK1reDCg6dinF5RaTVt86qGCQH10Qwa8LsPDPxq52R
         ugx/bX9jliuywNyDeCYa8PUNEPoqIika97R6QPb1bBKhvNYiy5WRTaCGbJ28rpawAYPb
         el1+aCPp+4o+zM4N4UNaQq/IEyibDAVA+/zjTqA+/T65Hp8do81uPO3uqii/6tUgr8zz
         CxBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf9idNzk0K/hT1R3i3dBlXOcT1iDFRm2QJpnHL1Oqjfx54RUgZLRITmaVmAW2P7iBwq4lboagaOc6c@vger.kernel.org
X-Gm-Message-State: AOJu0YyToc+j+qH4k740ZU6MOx0zQu0gfYBqpj6U427zd8y1NULPACPO
	ti8rk17Y1dq7Yp4CNAqdxPa7Utbhrp3c2aUr6OhjmMRVdxhjmtrM7WDeHBCixPpeGxfZYysE5C5
	/nJvgknsZxU32KW+yb+4eNyccTzfFNOj/Gno73+2TiWD/raUPxnFv4DKUDdECxsCZ
X-Gm-Gg: AfdE7cmyCy7R/jfHil8ukrh/a41ZiKYhigK9kVKp1ZXhcTa+3zohN6Tka395kIyw/pb
	hnlP2bBur4nOybmLclkFGkTrY55n1N6IdcEEPBzGO/2O9t9K63CVJVFIMGpmBa9rNFDuAvzJIUN
	ndvb8ndTo0HJFkf5Beqt35gFUFMjDTYUDS4xEwH6fchB8KTINGzyLTK+UmwjMfNC9hcfQbTuHnB
	6vVjGII0yM2xuxjwdQ1Pv7U+ov8q0UmCXK3w/E/6MgqQcPolVaUn7p8c+CY53hjKVr/5+If1NME
	kuUjcx77SAd6BGbtcA9mA/bOyxLIgaUI3aCJd3WwYixkQGuhdowbOv7QLKZcS9bpakucEumkxJi
	JKn0Vx6FMe9IXItCgoWmKbnt6GbpNFciFHvY=
X-Received: by 2002:a17:903:2409:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2cee9a6501cmr24050645ad.4.1784008990722;
        Mon, 13 Jul 2026 23:03:10 -0700 (PDT)
X-Received: by 2002:a17:903:2409:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2cee9a6501cmr24050405ad.4.1784008990282;
        Mon, 13 Jul 2026 23:03:10 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb76asm113416265ad.12.2026.07.13.23.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:03:09 -0700 (PDT)
Message-ID: <e3f3fbbb-f1c0-4759-975e-db6e11849362@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:03:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power
 domain for Maili
To: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2muHOB2xZGxh4Idnc8mHrwd8CCLCV5Kl
X-Proofpoint-ORIG-GUID: 2muHOB2xZGxh4Idnc8mHrwd8CCLCV5Kl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX3oBtTfRJx3+2
 0LbJbuKyepebM50EAYBYBxjxoJogiXEUiiGVdh8e31hpYIU8dKlN9MN84ihA5bFPKV3EFRY9got
 FlMwgBnnjLY70ugdtTmr/X3i4MHjMq1lEvbD+sjjEjPnmSspCEhG6/FrmpUtgYhH5KmNNpAs1WQ
 6YEkddq5iMvVlTSN8un/M5b7HfEhlHBaodp/qEn8HR5pOmEX96ctaL9YCWkbvtwkawEMPhW14KK
 s5Ez977tFsL2i6mP7vyITVDLV5GQ5JMSODgRPka7ypfSfc2IRLshuyozPtdKiXhAFQvL2U+kIBh
 N1+SVPavZOaJ1ojhbinpbw66lvFg1dDOciwDQmPNmfPqguvUzMhQgcDqUde9AhobrrVyidbIFN8
 oxoh3Le8NzyVqAD5/NTCLiWfp8QJXT1sJVjDze/uICx0z/wJGFmiF5x20KCeNoQUi8pDOOp5T7y
 K7SoVK+7V1JlEzXI4wQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55d11f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M8z8ihAFdknKfOSP2e0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX3rzwEZ+OBs43
 MNXcyyvErMLjOAfcGPaYHA522nIb5MyI2E0NoNziE+2nBWV+MgN+zFmd0yzNiL7KodW8jdk4rdp
 duPazsLzrfAKza/0/0UE+pMXUpb1pak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140061



On 6/10/2026 1:43 PM, Fenglin Wu wrote:
> Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
> Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
> "qcom,hawi-rpmhpd".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 0bf1e13a9964..9f3c8cbe9d72 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -73,6 +73,10 @@ properties:
>            - enum:
>                - qcom,msm8937-rpmpd
>            - const: qcom,msm8917-rpmpd
> +      - items:
> +          - enum:
> +              - qcom,maili-rpmhpd
> +          - const: qcom,hawi-rpmhpd
>  
>    '#power-domain-cells':
>      const: 1
> 
Hi Ulf,

Just realized that you were not added to this change when running 'b4
prep --auto-to-cc'. Can you help to apply this change?

Thanks
Fenglin
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260605-maili-rpmhpd-2079035fc51b
> 
> Best regards,
> --  
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 

