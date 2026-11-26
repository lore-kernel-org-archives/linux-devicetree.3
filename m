Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704822;
	b=zfxGZklt1kbE5TenYO5W0oZGO1mJW8dJwXiEyC63VvKX8+Tk9f7iFnCDKNl/5pz/Li6j
	 i8OCCq4vNypkdfkE46PN/cUECfViRgsFe9kOoJJEFItYJ8ytRCLII4NznZDHL6e5mBeis
	 f8Xm4yIX2c4QgA3SQwKsTijcMrooRxx72U2KpD0BtdRBSjeX6/9DiErx4ulxW9x7yJvhx
	 ywVDEKVE3xUOwbdAIk/6p+P7uMceCzDqqEJJWgKkJmKEu5CUpsyb/1blfOuWYCnj8slAt
	 Wd3TAAnAqUxVBK44lHENSbtflmHe/7PpqzodMGM/OL9qgrJt0sdgS7GLmRajCwQpmHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
	b=o5sGkxF+TgRzLU0XdrKi6XzZYpKYWlqvCsUPg5nmKUMSXzJTDEvT5e7wPqdVsZs8DKsf
	 fpeQ8dFIrttr+8GESe8moXaHXQq3Jub11CHX0vbEnYF4PCCS2NIHPd778hauloISqJlT+
	 HGc3TWxSWahSix6QcEKJTu7eUXcsFSNqOUZXcLyesHQwPkrl445jXASbpTppsmgA3fyZu
	 mA+Nzz9xa8BtHYNcEaa9sgdJSRy76f3ZUAPq8lphyhB7SW98ZZHn7JIw01n+mdKNKKRzF
	 9Su2dFAsuD2bYohgeYadP0VSO/IgrIvH14Kkk4M35FfED3IY6lZ4ksJsA8I+0od+L6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xx8mmWzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=io4YrVAm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF4606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80EF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xx8mmWzf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=io4YrVAm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV0eP3170236
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=; b=Xx8mmWzfbaRK+Fjk
	gtVUnKXeR9o7esS4N1jJupBCvvPxykRHJXr1YXnlAFPHyBQCtoVAmtID8RV0CNCs
	QoPpPT0EuDvyDbzSuwvGCiOYjYP13x7yzXG1QaGPZmPK4pae5LtE2WhODL4iob49
	G2os4P+Q/Ax+zK8NYOL/rpTfffAqXk/tIHzV37MnmImA2noPTrBuU3yI9JY7zjiD
	9055+oErjq7qXfpUHOfKQ1iwb4m41IXgQhFnFTxE7gDD5kfos0FZvsbDDLgLxmUz
	gIVcnOLcKV6OcQL8H9sF+O24KhcDNhPtOy7RTPS3Fd1csDbS40zJC6C8er8Kn92n
	f5v+Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbcqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:53:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso100238985a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704820; x=1796309620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
        b=io4YrVAmElPYsFPhmR31kQJ8WLLKNXJSvkJr17We+WQ6y3SjMz44nqD97P4G1hRdqH
         3cWXWwX64GR7Qn2uaaxWWGcmfqwHskG5o/bcaABDtb5SN+isb3bX9/Lr8rcZXRr0cat6
         Lfc3cpFBpLLSLVU4NXrDOR+WD/tBATzZoTLezqqU1A0qE0uX8p/rC1M/avLlwU6u7kyb
         vmA0Mi2+fUt2jSHDd5B/h+9vUV400Vjcr9ZQUZkmZ6a5WitSbncAHEWi4hSH18NF5HLo
         zVUT/d/8xJnMCm3pQE2ev1J5w2u2GbekAFAdENA43NtMWOklId3ZhPuEwo+7IeHLol12
         c6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704820; x=1796309620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
        b=bnJfGSJpCX4P0soRVic7AOHoRHUQZeyNz5yhM0slQMeIN+Su/mbe1pOqRreLnI8k39
         e5f8QCJVIea5jVtsFv1H2as7jzML//Ey4diEb705EdDeK1zC+5Vc7r1naHOVnUDpYO3t
         huhow6jHlT//+nKhBk0sbBfLGxB+kOC6BFUBKjWopSE3QkDVKQifpSR8qF6xvKlmZknN
         iAvwsGq1GtvqiFLlU4uozIdzqt3pAUpFX/od3g4GDb1MJa09W+uZDEDK3WENh6XNcnE5
         9Kt8vTyI97qcTCvVkw6HgfhVIvY+0ZtrI5dWl5xq1bfG09PgV4G+uF73NSq32bgwnRJM
         VGhA==
X-Forwarded-Encrypted: i=1; AL+hErELSkKG4hfuZo1Hfa+SLXud+oPlekH+MSk7wTjy3xBYh0AcGuTVBuPK0QuUju28N5guoQaVNE/Pcfz8@vger.kernel.org
X-Gm-Message-State: APuU4Z+9y3ESC8EqbWzzanGRSd655P6Dfjix7TX6TgSGqb++Kt7fZ9xS
	53dPeg5499A3agBsA3s4jlQg+YOXMtl/+1vTn/TKW9XsADrNnE5JIwZpszWA8E7qxsjYkkGg4lK
	qXj3hx4kyp2Fss2yEwlyO9Ht2n0kuvFDgOzCcUsRKu/7WisEYM04KrSMqUi5TlteX
X-Gm-Gg: AZFdTZd6dOhX9RtOsj95W3lHgzN3puI2QzGbIG4M8FHwrl4CsJvMPR3+QmkJPs+qTLr
	YSU2Y9jm5TWCyNCw0tti8OqN8l2ZD5axGTK+nvDiKpZyJRwjN01l0oy+sgLdImxJJuseMUhJ5fN
	EZ4O2HLKgvD404mQWAq/Jc2DroGgXOugIvVzotxClaQQhxdt+hNt/doDwmnK6XiklYUe4jvQBxr
	XJYA5eMtFnNRCJnGutHW4xbPLodVdPZbh8xqAx5oCzcI6Q2bX8ogGWIAAmr59zPKZXl2yk5iham
	QC2oS7C52lXucG9F1RZadi4A7BIf7lL7ChzIRDfNnSAoFVSKJCsw7UpN0Uoc7i5crP/J7hMpGYA
	3cv3uEZXXXD3LybeDNloqpPNGfycTF9LxPhgbJzuFKjz78AUE1bUoX/Bve4P8vBNyMI83Hg8=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr3838088385a.4.1795704819960;
        Thu, 26 Nov 2026 06:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr3838084685a.4.1795704819513;
        Thu, 26 Nov 2026 06:53:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1d03f9e5sm2794700a12.24.2026.11.26.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:53:38 -0800 (PST)
Message-ID: <130d0531-a131-43d9-87ff-5c6f069efd80@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:53:36 +0100
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add
 battery fuel gauge
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SAXeSRGIvVZhV9zU4FLwiOHDwpvel3qo
X-Proofpoint-GUID: SAXeSRGIvVZhV9zU4FLwiOHDwpvel3qo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX3HMDTcS9tGQN
 NZa+EcysoqGYC6VBoSUHqHh5XwDN3AAu6MH8Ye0vhHgCVGK8Vt5VtQzyBOUEnkMKAD5YQff4Tdj
 ZYbwWx8NKtVXD+hVcmnnM+oV+lS0g84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX8PCRW23zp4tY
 ofiLnQ5m9g6Eymb/Mp0jJ9M88lyzAGk5ZIDqAQ/mHu5hUcShOiezGb8s2y2UnJuBP8VGYG4cLnX
 5FNI1ZttgP6x/CJa0ymgnDcuvfdAsxLWQ8Zycs9uQbuLxS2ZkR9tsIQfywOGtl/jYSfwAUPTKm/
 MltmiVePof8FL6r73htLGFPHnSLu0PUK3JIXF4c4v8wVnrTY0EkOU0ARY+By7mGBSUc6oDimwvl
 G24I6Mudh3685FVVTzBFhtfoY93ggO4cWYHs/G1KLHrXiOE9W8CaLppwPGOnLZkozG0GzdJEXgO
 UVOQzvJqUQwn2CCzRUS+4SItsObRErB4d6HshjTHLqcmU+I7qjuUkgJErp1tIt1/2fsz/ajZ6Ug
 g3IC2FocprkFEFpZaLnAgZ3ttwIaksio3vyutf0aofxcGZtSWtMHV7EVpo8mGA1FWNjB89Jx/UW
 F7oTxkCkhUuzVBxLe0A==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b0847f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Qe4jBd7IcWueaIHj7iYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Describe the Silicon Mitus SM5714 fuel gauge on I2C hub 8 and the
> built-in 8400 mAh battery it monitors.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> index 8323eb837710..511bdd05d49b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> @@ -31,6 +31,12 @@ aliases {
>  		serial1 = &uart14;
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion";
> +		charge-full-design-microamp-hours = <8400000>;

This binding:

Documentation/devicetree/bindings/power/supply/battery.yaml

accepts a million properties. Does your downstream tree give you
data for any of them?

Konrad
