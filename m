Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599666;
	b=NuE9MH4+c/5j23fQBGLq5x6d/UIJ/3VZn0gzWuIJNRSdSRG9kabnQnh7Fn5+es1TCksd
	 Q1UrPegxd9KdqqkEdtdh10w3YW4czaxPv9w5qGmG/BRs/R4EAa4WTwjPKKrVIig3eoZY0
	 7QVvd9THfY3JZnUF9+aj5fJIZJ2suI1Vgj3vRJ+VXdxyNEFghZOXIKuKrNLD9aWXk7Abv
	 /0SiWHrNvotBg0UBmO5HVu5vbMnQ9noivtL2iiO2xF+Ba0teJRJUTIT67bNMip25Lh9mx
	 j21/u0YwRTB2eY/rSEp8dSI7WxgEneGWXyXHsgKiCnSBJL6ByMl8nJzztm4hPIqbPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
	b=xEBxY9kd3WhuawRLphSmso8Mx6Z1p1LSPPaM9cPb4U59C/hH1+iVjfGS4PzhGB7mLcxI
	 555sDUu6BAriwWdpK8rTxRJh0zN7BvWYwIPGW/8GDj0d9BanLElpMVJuHMhanNsXwdaUX
	 /wM1AHjiKJo5NQSuWg5+dIty9oAQpxPip437+/58AYzNc+CVzcC22n+D5AbmaUpopAXMy
	 RG5qLnqqq30p7/4v67ox+lWwI4qIL009AwnbdG6z7aVW2L6KvJuhP3mIHM2Mr7JHbHtF/
	 LoRC2MHtrdMhqOfd3jrA857YT9bDsL75yDMMxxvPQnhOZHzZjt+rnU1Oywhiv4nDxeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFwq3WuU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQmriEFf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B4606AD0E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6B4606AD0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFwq3WuU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQmriEFf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU34b1557850
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=; b=aFwq3WuUbVXDccU6
	ImyH2DdBjjpi9JffnMykpYkmPPyflDaD7oOAy+hZ3XZAposKZjUgaDlS4XawLN7i
	kkJxvoDaZJ77FNCLX5TBxEpJST6D/nriLtxkUMCw7Tbm9dakplSQls8FNw6r6Dz1
	IC+RoxfII7elux/+iPoegwbE133XoorW+5FY1mDsbiD/eWS254w0t5syY00rrl/2
	ti8Xgs3kk4c7csJoDWLYR+TT8ziKSocv2B2+e7TtULdiZ01BE2WNtAMCU8v2sBpG
	w13+UuRQLb4WTwrf+lovp+Q6t0acYTpILdljrIJTFFOHu54hMeIVTI3l9T7DfqjM
	WOjU8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmvqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:20:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so118319085a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599659; x=1793204459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
        b=CQmriEFfeOG70Q/TgOLioizPnkvqo0SoGbNfA7JY6K5LRyEKWEjp6y/UZyi883KLgw
         jYX+wc0GsYjw6EJ1xVo+3ncRGacUo0JhjTmzbOD1kwyUITETL0DDEMKnINQr5ra5Mxad
         wsN5+VaNPuwfGuKDK78te7hb7dqiOzGgyloA5fseLVVxyxYZp/LkK/rTQOBEjLsFYBvy
         HlD0w5KFCd3uu5OOlzpqXFzZJipZmaJVz6rm9+57bFEk67L6Q/nwdbcKYIhDtOQ3BqJK
         PDbGQ4XUO3S4x0jWIkS8h2IbUXEjhNkgql9kEPALDXUdINWwJlyckXskKsKH/vvA/3HW
         O2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599659; x=1793204459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
        b=npDYEbeCKdyGOeQLjPpQh19QaCtnQfV7DKB7ay6bmpPZYO9dT0OO7JPJYp6mJSoYxv
         nlltmPQhBS3UcpoEm1zs5JQHdddpBM6y6YZLy+KRfqyN2ongGOgszUbqwcff2mfk7v26
         9LmZlOH3tT2r7l3cbEhxtdLlkA3JdI/fD7LSI7sbMQNDLYYz+nFM2vePm6a7T7feiRlZ
         IIwzTyHeZjDn7PHLshWGIhlzhwycKohcjg0BQTds/Ghhefvk8bxj+Y6Cx5hVbl0mR2ir
         0JU2kNAWB7lppBUFAq9REHWqTeJ6b0zCnR/02fx1cCC/gT+JGqd8IZiwU6TDzU9jlprz
         NGFA==
X-Forwarded-Encrypted: i=1; AKwUvByOb+loS66mKwhNBjehq5NHcG37GxGo6l2q/3kvR54nKkIuj6UKutWQzTazTp8g7tF5DxmP/aNLc6pA@vger.kernel.org
X-Gm-Message-State: AFq9FYIOEaqlpOA8geSKr/JESRAXUsBf8tpQ63L2UqFo9KYjY5C41gbm
	gOxkKdToZH0TxE5TiE67NoOJtPLDn7c1HGkNx8WuHlTALbK0VIO4CVeCT1F6OLVbXv3G4uFTnUw
	Bi3BqGeeSlIdD5JoT8W7cDIP2F7NgCGqHZV/g8+sO9b7y+Fl+xxxg7PQhMTCtkb5Q
X-Gm-Gg: AYBFou0T8DVhZVt2Odkiaan8VMgAUzdZoRESf9/1weQAUnC8HVUMtmwHUPp1pU97VpX
	iRINFNa4V5iUs+0e85SgPdgp23gnr4eFLq82aTrcSib494jnA67uGF5+gJGyA7nDLUWlcyAqdcr
	86IHDWPO2i3l1AADzqym3p3BcaIOoEWSE+uF3cpDywRkqBN1dEhINZr1Da/EFbWYnt+AsvtD2Qk
	D9dFibjx8n6IoxB7A7Kw27kWGezHBGqj8VRvElQepAc5CF6CTSmhnExO3Mxzl31gIv41sqxUGPB
	WdIz2DNAyW3UyQ8AMZtoJHKPSEyZ4cs6NQbD3UTkQAF7z14lsKAB9UcMignEusFkvbbiBhnoA2m
	cQ1GCTj35c+Qj9OTAHru8EmFA/QCDNxxs3h7I+40+2Dk0QJVgOCf9CmrqAaLyYw==
X-Received: by 2002:a05:620a:269b:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f57ebdd46mr452137985a.6.1792599658568;
        Wed, 21 Oct 2026 09:20:58 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f57ebdd46mr452130685a.6.1792599657853;
        Wed, 21 Oct 2026 09:20:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3887:4025:a805:2ac9? ([2a05:6e02:1041:c10:3887:4025:a805:2ac9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm7092835f8f.42.2026.10.21.09.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:20:56 -0700 (PDT)
Message-ID: <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 18:20:55 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ath8tHxHOdA7G-Bx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX/89u2bOn/V+M
 twCGhiMtUMEYPNV/0sDYaPIHr/ucwvgnSGY5ggEHKI5QoG4K8SnA8OCtESiVK3vbiPhq+yDM4vk
 b7CKHCO+byBMAhPl98ynB5IzABMEAI+fO4DFfCiul/cpLzRRkFuQNLVUk5UCLPDQRIgfwyynsyM
 B0cpu8/VUOZsy2zweZCkBUcheUAeA50MbOVH2ye4pH2jM9uGmSMJgR+h+rT5ZoB4X6pckP6NQEF
 TZZHz0lOmqOSpMt4HKJIF0PqYrYuwmU8ETIqyd1st1hsB++mx8do8QlP22Ga3omto3+A1wknD1n
 J0lnheUWgG1GZX83p5LJspHCNTo+f6rG133HLFMhbXd1iJHjkCUzkgP0+UXNOB/kLLUADAbiSy1
 XgEtVaoXNTaFhpeRWum79j5iqpa/elmRYQKzkodg1EauPaxXrmUfiD2YA1ih5Mn0EEkBNrz1OSw
 628MGcA9fM4aKOCZwNA==
X-Proofpoint-GUID: Rxd2a17SPcRbZrUqZX_XY3SgHLLKI26H
X-Proofpoint-ORIG-GUID: Rxd2a17SPcRbZrUqZX_XY3SgHLLKI26H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX9nvGpqO2EjdD
 JjTbfr7QjQ525jXEHjq1XJ1bXJRhsSg7k6c1EaZR1TvDAakOO5CjqaxTLKH8A+NEr9Ym8JiWw0h
 fcJ7qIa1bDejYSc0CYnh+enoyefN5DQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8e66b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=OaStsYZM47bEMq8ebD0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065

On 10/21/26 10:49, Stephan Gerhold wrote:
> On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
>>
>> Thanks Stephan for the additional information, that's very helpful.
>>
>> We currently have an urgent thermal issue on this platform, and getting this
>> thermal mitigation upstream is important to prevent overheating under
>> sustained workloads.
>>
>> Would it be acceptable to address the sensor naming and description
>> improvements in a follow-up patch, so that we can get the thermal protection
>> in place first?
>>
>> Of course, if any of these changes are critical for the correctness of the
>> thermal mitigation, we should address them now.
>>
> 
> I have no intention to delay this patch. In fact, since I'm using the
> latest unmodified stable kernel on my T14s, I'm also suffering from
> these thermal issues. :-)
> 
> On the other hand, we are at the beginning of the merge window and Bjorn
> is unlikely to queue patches until that ends. The changes that
> I suggested are purely cosmetic (the names of the thermal zones), there
> is no need to repeat the thermal validation. The throttling behavior
> will be identical no matter which name is used for the thermal zones.
> 
> IMO we should use the remaining time until the merge window ends to
> correct the naming to avoid any confusion for people reading the patch
> once it lands.

Ok, fair enough

I propose the following names for the thermal zone:

  dram-board-thermal
  gpu-board-thermal
  fan-board-thermal
  wwan-board-thermal
  chg-board-thermal
  cpu-board-thermal
  typec-board-thermal

so we can capture with the name the ones related to the non-on-die sensors

Sounds good ?
