Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189061;
	b=JRcL+khcQob+bnnd03lPFn50XnIYY9YOZrjvf0ratTlsYugDBIf3rIYhyZDSBcVPG9X8
	 g/2VR13d2REnL5S6CGgjx5dMW8zDvjHOuGIWxgv6MKGH707lBc+ta/88cLD42u0hH3Rqi
	 H7m3pYCT9NEulGgo/9i+DIIC176wE+IQlJfXJ/F378TUKlHxUHTubno0RNnBHoiHiFoHd
	 XEye6f8P7VNkpxbopbT4NiZo2xxbhjqw15fhuyx9kcH3ns8F/zqAEAC4LnsS3qtvvU6dP
	 LdpiqGDgKHY0aT36J7tr3U4rFUV5p3TjgPJCnPw5T34sjNsS3qiSWiNbsELUr6MjYXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
	b=1aFEPEROpDhEIY36kStYr5U5LuYywSwEmaRrYMsHy2SCLkVYMGUeUB5GtCOHXgmw7ql0
	 zrNMlXVwSw+T+naj20IraCzLJnzC9pFU4sxMV+teV1jxJ6LJpQq3O69rneJJv9bSnrS5g
	 iDNiQcyVIeJE1E7HIF5i0vcNdtX58dupVmxJ26/2FJCNNGKaplf6P9jGm4M+r1OTJbBN2
	 ys8sek79Nrw/bYVIiDrwBxtQJC6u9H2rPAXmsRBsgCcsnCnpLUnD/zLTjXO95zvLsIwx2
	 8iqMGgicfnzsr9QXa78UryEu7F5Gbfce66x+H2ZwO/gcbOfDqAtMoKhN/QEMV7h2GVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935F606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B935F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeB5L1606956
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=; b=A6snvN9mZVyi5Hr3
	iK+WpdiaTKaqYIz/umvVihpeIn6IgxYYRXTNYoKJT2BttvtFDgx8ecfaZyaa6Zue
	BFx1aULCEFAebWHWU5MWzEdhgyEEAax/fldQaIPi6dSEzwAbWfA0h8argoJf1Ywu
	47PsPHFnaiICKAjyrXrFhaggHHfvTL6eRUloYxZ1d2HjBG2XisYZ7QyvzjmRDdfV
	49+hDLPcoLHvqH0bjAbrXEY1+pNrIC9rMHUtVPXL82+SoYI6KDfHwUTLncUsZMy3
	SKe8jms6Rhvipxw5RTYHwkKd8I5t2wekF1V+QxPZsSY38hFxfK+B0ZCMZYfdA3Oi
	0hEzXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j244-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:04:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so62857e0c.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189059; x=1793793859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=H5mJLCG7NgK9TgtT2xYPSGhmEEu6TtQWhXoTXS0hHL6lGk13A07MStjbUB3OQzRJgS
         SPcKp1VYBg0rc4Zud4a7HGoBgzJSVoOf3FNc1V/ftd7WRaEUXSbt6TvbjFwq6iBGEApW
         +P+mS3knShJRamEt3DHDPh9c2n7VVA5q6sskO/pEvjztEepyJtF2+uiEY5stWsMi9J3E
         PgcQ/7uFg9elf3As2bURA6Vs3mEy93ljMJydYfOXmXbcw4yNx4mmeiIdcHR6CadsVL/z
         xhKze9ofZLYuuSt7nm6LHJsBEHDEBQijgXtZGn7TZDxrCS/3d8IpfYB4SOgvJE5c+B2D
         b9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189059; x=1793793859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=lYqr/oXM/RCxqQ0b+u2uKL48g+OW8REIMPr6w/BNwzihXGRvqyVXhRUK0KLMOawK+b
         zLV2PVRhu46PHja6M012rca4PbifpV6sQkKhIj3qNEyPwWch1UTtN+LDpHh9qnzH1gdB
         Mw45UeoFYrdKCypbvnvS0VbRgd0rsMh/K9Gr4cQIbM3CtvtkmSsOhzdiH6fcF/Lqz6pX
         znXdbsvWFBiVPSDhzhk4h71YnvkXfkSzuk1H3v/Iyd7DhFc+Jjoq9cEILCqsnv6+9WTT
         1R9C89xpUfUdxEPxcwdKMq7brvbDY+JmiN5uWdrz5BddhdACBc4nWUHr0phdATkYWUmV
         U7Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzrzYxCZ471LOuuiRVNm7xouruitT3TcrxXQfSV0hUuYwjSWLRSA+vN/XhR6Zh13u5g06y/wAoZscYG@vger.kernel.org
X-Gm-Message-State: AFq9FYL1+liZoyrxu70pvZ/EwuZ0++aLP+FyC80kEK+8f3xHDeONaWD/
	PKruVb5KopWo2cudwajz8qB2ZOO582onopsF3wfwlzV0Cs0j7PkCDdbTDKztZwQFFh4/hfxVrJw
	EQHGioAxAGKJH/OpcZp9DdPZuEchVFswbPvUWlFv1bgv8FsCgCvzbEeTeURzkiMSQ
X-Gm-Gg: AYBFou3cz2drlhoX1UsWiEe31C5vhiqyPv2GjDl95kfzwX4Bo+YOEpRpFPtXyWBsqgh
	B043TswAXfBwSl/SZaJS/p7QO7xu8JGe8Lu39b6ejAks/Yxf0IvROPaldWUzZ80jHzGnO6PTSeJ
	k82ESb00K5PbJUYKCzMO0FELHykPG+L7R7U/RcHJsLQrVAUFHh+IlZ0JXyl+0P+D41VoSfoBiXf
	LmY8MES3EilmDpgob1UYiUvyAxOch7GpB1oYkJX7o7S5xcRqtUsis+nvI8VTr840ZSYDIdyIP9K
	qcO0qUeB02fMYwF1CvgV94aCDhHE99mRs3Ag34+b4ArkZb3eRnyUp6qCi3/9XkGeGtJNHiCGndF
	2gHlB5+7vvAqJLqnK5RA+wV3kXvErCTHNPZnEgBLi/gAyYI8MrnauqUG6DS94Eq8U+3HrsI8=
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577571137.3.1793189058789;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577514137.3.1793189058217;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm1348803a12.19.2026.10.28.05.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:04:17 -0700 (PDT)
Message-ID: <96405224-72e6-4786-b13e-d73134b58ca2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:04:14 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add vibrator
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Enrico Cic <enrico@privacyrequired.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793135056.git.soyer@irl.hu>
 <8717c3739be282747cbef611d242acfc5a40656b.1793135056.git.soyer@irl.hu>
 <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX0EodFQRNF6hC
 fAww1zA2udSQLi/oe1dBPjTQG0wBc7lau5XW/KfTG0zhJo9wN/fy7A8SrAgzs7s2zWZIL4/90qk
 I0jvGDknoTPRsnHdjlgqX37umF2NmHY=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1e4c3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SrNx-AKsgThqvEfA3AIA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: VJJ4L7bFOU_78F2p9g8oLC_Z0Vn9AgIZ
X-Proofpoint-ORIG-GUID: VJJ4L7bFOU_78F2p9g8oLC_Z0Vn9AgIZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6RN8GVj3beZT
 Gv8KtuiKnMakzsieghEFYj9JWSx3eps9K98yufWoIfQ49ZNBM+nDJj72bU6AObS9p79UQgimr2E
 sI/kBWi1u5hwCbAzeN76Bs81aPqPBF6s7iyfSsnCBgUQOCFWmv4G9WLzVWxdLTIJGU0oWS4Cny1
 G/7CLJYpRzG9mUMvWHCONYrx1EdU7u8PZMCu9uNEMXqGbOJVOHihvGWpKvXr4rsh8sfUDeedi6Q
 xpyOmiZ904s/JGcbQB5Sq5EFkE2HYfnrD6b3HJBWPx3dNQAkX8prQS9M2YbbEs0sGBmrULC/TmF
 6tVIBn7DXH0cFyuDTQJNqCPA6t+RFkYyM4qUjkD/3kSX523ZIjKLebTiH+Iv+GIkxKBt8DkL5QI
 dmN2JD1paoBdl7H8YUfXITsczkUx4GKmjqzu4RBmwDchxHKgxU+h3eXMt2Vwv1WqnAKU+YwUws6
 3ZiQ6386JMPs3E2/njg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047

On 10/28/26 12:08 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 11:01:25PM +0100, Gergo Koteles wrote:
>> Add the required node for haptic playback (Awinic AW86224).
>>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>>  .../boot/dts/qcom/sm7325-motorola-dubai-common.dtsi   | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> index ef91986a1fb9..434846be51d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> @@ -924,6 +924,17 @@ &i2c4 {
>>  
>>  	status = "okay";
>>  
>> +	vibrator@58 {
>> +		compatible = "awinic,aw86224";
>> +		reg = <0x58>;
>> +
>> +		interrupts-extended = <&tlmm 47 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&aw86224_int_default>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>  	wl2864c@29 {
> 
> There is no such code.
> 
> Please work on mainline, not some fork.

+ please keep the entries sorted

Konrad
