Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236238;
	b=4IH/4YrlRetbETPqYZHjNYCEiFj4fpmF2QM8ia5B3LPIKo2+/5C3GFZi+D3WOeHC1RPp
	 IAgnI5HvUVNqDEb6TsXQ+veK5XDirJF29svhU4rexPQGDiLTJ3RCEcow7Xi/vMwjJtafb
	 MSV4+694BaYWJ8U59UyWnwgkp+wVNPbf6EUHit0kRUfEGNLiRz5DsSKnBsU3EqmwDE8Zd
	 nBfuGLgTHjQ8E/mg/pVvFy2ljBs1UG4Tyv43A75a/jSHERS6hEm1dnmvyYb0qYqU2fw56
	 U+gQAwGHtxyU/6Bhb8NzWjFQivxWXkU5ro9yL0m7j49GP6FwFyT96v12uir0SvI4mfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
	b=24jGjCQWTb9VX7COBZcGi6vCGsL/N1UiREzRfYszVVzZFALOjKkWpbfoH0FCXTfzc4RD
	 iuZoRGf5XX7QhfEMWHapP//yUfhNdnvsWnjPzrfmYy8kshxeHyfONc66/3WfUmKnXazYP
	 IXC2uhIP2ipuemxUnG89pBfHjTPUFknmZ2P6nD/5zQrYtnof5nJAg7FR90PIbbWGA35nD
	 07tbobhcbvhK/UMP85k6GfZ5KIk5Nkb6EQ8m84bAAnrpHaqKmKmmW8u22CduJIK29ax1z
	 IBORRlEy+ABQ8bZw8W8NQsHdkwk7PxIVS/8gNzE7CEzlhfBghVyGbxZmadcyx7Mmh8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E010606A33A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E010606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFMNY359447
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=; b=BFq8BqgOWHBy7rpY
	XytFy+kA7CtV9qJKCSEga+ah0ixp5++GUYK/Mw4xX4A6B7vTvjicuz1jHZ0Mwadd
	NvL7ttkZhTk9Z2ZtAu9LBI25Pft4BOzMZ+Ka44GAShWBXDDJqTpGFX9suhX5E5gG
	zd+oqa0khh4OtC9oyEhOq/i0JZbJDKDktcYzu35upbxiACBlDFxd6M8WrXGvIcxC
	RXl/fqlDEgZF3dIo+mAdgm7N5WtcbSOBg2Uw8uf4HKJv3t1reSSvWnO2QrU8uF4q
	tYK8rpMBE8ihUW5asCWoglo/6hzzrU+1VOANKRt6JWa4Y0alAXyMzwCl3C9QADxd
	li5v2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2j5js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:57:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so23132185a.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236236; x=1794841036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=DpR+dvKUW3JpQG5mLvQ1D9BxUA1zVmYGjI0vs/YntxA0L1Cme0fcVElNOyucUsO2kT
         DcAIJF78JCcmQKWIDKrgy9BF2K4tBJpC7dhUJ2qU7Ct03k0BvajPd9duUYHS8lpwXIqD
         lNpGjUbgLwjN8lcH05fz5Jp+Rsfm/Umd1MGwNm54ANmAaCzJz/di1sKve4DucAS550El
         bX1YLV3H2OonyowT7GbVKJWHrgSVIFON5Y+ZxXTWCswEtV+S9M+Pbx/XSp8ryGGV3ixR
         kbWDo0onJ7csX3UnCQ8ey0hz5alrS3FHG7pfdZ4OCwbaWMUrhTCD3bxO6tjmjQTwgbHy
         /FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236236; x=1794841036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=iAaPTKuryehbW0Ch0LxsC8Dibn6SrAr6n+tJOMoEJFbprbRm+KB7S4jgM1A2Np3KaI
         hUGBSMojGyhXC7s8HuA0Tyu+VFYxY4Wn879Fw4LaCVO9n7zlTkA0JPO2eQKFANokNj54
         SMqT85o/Oesx56nUj2epfVg3XzvF8ycFE6SWMym8uqNdImYU8xlnvOZjoHEHSMfV5yjt
         4xJMyyyqJazFlAE8EsZIrqDO/P0z+rmjegqiQFwDCJVxGMProPZiRDclCEHfYxWf8AnU
         H4VTVdHy+NE2weObxokTFuzOPEGyRX2nvPPuB5E0sj4o+9gWZS34gyzK5eu/V9aBojG5
         nxmA==
X-Forwarded-Encrypted: i=1; AL+hErFT0tOKvAVpfv30PARp2scN3auHeEtqNVqwCD6nbP7FQdJBEjRuifV2Ss8asnrX3MtrpQsUTLV3GOt2@vger.kernel.org
X-Gm-Message-State: APuU4Z9+uXxP/XpXGozUY5K1ud4ffUbfK+Fgz/8DaU0qlozqQOovVDpG
	AQnJs4//irzZY0Q9LMDKMifEVkMiOybbgUzSIJ/Lb5+bGChWWq1h55NMTLdOgGsAh0XVT+arO5y
	vsuFUTvqTvJvgC/vOvpkzw8iB8vrB1UGyis8AaDKNnxflRoShbS7GaLpD1IFlEWnQ
X-Gm-Gg: AYBFou06jhMXnDy8He8YneNmpuFn7sLOMep0KIgh08oiEVJ6AYSYFwIVkkTIaO716hw
	Z+HKfFBimmkm18aOKC9fD3t7yyJJifxHEOUFhhV1HbvnjeFV3pOzrjifHBm5S9y/wtAa2GctTEP
	tfPmDRD+q7iZN+qeY4TAqR3T9xkACyAND8eDZQYBqvHGon2RODKUCKy6QiIvV1QvAtdpcePBQ6e
	NhGgcVDrHSbUuoqEtDC+qojDGGLZ7MXF/ecPLOcd/EDIoZxq/oOjfNnCkpTEK5C5YeU9PD3BUAO
	PfzfkebXIrOdbxuwibIE0m2xmMWeNZ9yn/Mpf4kkF4HYdGEd2KbHSwqt5VfJY8pXp21LNm+oKwc
	COoJ690CtxRl4t75kZpMkgLysoK7ae3f3OgwUE/b8FybQr8ZnkdR8C3A6ALEHCp5OJB8ROA==
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643352485a.6.1794236236350;
        Mon, 09 Nov 2026 06:57:16 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643346785a.6.1794236235768;
        Mon, 09 Nov 2026 06:57:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f943fasm178778066b.16.2026.11.09.06.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:57:14 -0800 (PST)
Message-ID: <cc6e877d-0d54-422e-b9e8-1cf8b8dbceb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:57:12 +0100
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
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <mail@fhannenheim.net>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
 <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
 <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1df4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=MDqjLbU1OJPnQEr_jJMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX4CnsOOi2lBUm
 2tgERh8+vAnQqpXjioSmGHIo3F6RZLJppCEO2D1+BtWY/G6a3wqRLqC923iXhgnQp/nN2vW0hJZ
 Agv7lU99ccY+vKA1vzQ6asuv1TIgjKoMZgQBZ8iIyAeIWH8+NSt2Mn+nNz+UpsylSinr4FF++8n
 xTclc5gYWxt0T+nKk6zU7nHhNKslGIQ1XsiL4VTV7plu3siKJzzVgqJHkzmxsfqSGFXQV2XUXfl
 DVpYoMHgqatsurok4NmqvH3i3t0kLeq0e6P3z4GpxOzRAaZZnvh0wxRnxY2c3mQ40DG/Lzco91c
 r+tKoi0+uOZdfcHL1njjOfTIAgRhKBHnjJYzjMrikVmpBKeRdeLmFTNhLXxn/u9ycCtQipi7CWC
 YY9yJX0WXFJ326zZC9U4FjHDvJ1HiD/vAW2DMbbWQxFCk/WKwK7gbM4TcriU/krTT7mY3XwMD1S
 f+ilB2YfVQ2ENfbLjWQ==
X-Proofpoint-GUID: 0CmHYad6sJlyDWZbaeSOVbfjt_P9wbZG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX0SkaEymQiUXR
 cg3CDTIRb1bXNh3lL85LyIw2dTaG7uWz9UuY54pTc+RbAODsAm7Aj85f/Tmxy0EMEOrI7GK18N6
 JEZkuORzJeJI4Q36aIhF8DHEJKx4V20=
X-Proofpoint-ORIG-GUID: 0CmHYad6sJlyDWZbaeSOVbfjt_P9wbZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059

On 11/9/26 3:53 PM, Frieder Hannenheim wrote:
> On Mon Nov 9, 2026 at 12:08 PM CET, Konrad Dybcio wrote:
>> On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
>>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>>
>>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>>
>>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>
>> [...]
>>
>>> +&i2c2 {
>>> +	status = "okay";
>>> +
>>> +	pm8008: pmic@8 {
>>> +		compatible = "qcom,pm8008";
>>
>> No PM8008 on the other phone?
> 
> There's 4 phones in total: 8 (instantnoodle), 8 Pro (instantnoodlep), 8T (kebab)
> and 9R (lemonades). The OnePlus 8 doesn't have a PM8008. Should I define
> this in -common? It would need to be disabled when a dts for the OnePlus 8 is
> submitted.

Okay, I thought there were only two. Do the remaining two feature
this PMIC? Generally we try to do a lowest common denominator in
-common, whatever that ends up being


>>> +		reg = <0x8>;
>>> +
>>> +		interrupt-parent = <&tlmm>;
>>> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
>>
>> interrupts-extended = <&tlmm 112 IRQ..>
> 
> May I ask why? According to the docs interrupts-extended is only useful with
> multiple interrupt parents which is not the case here. Or just for brevity?

Yep just to be concise

>>
>> [...]
>>
>>> +&vreg_f {
>>> +	status = "disabled";
>>> +};
>>
>> I think it may be cleaner to move the definition to the other
>> phone's DT (are there just 2, or more?)
>>
>> Konrad
> 
> The f block is used on the 8 and 8 Pro I believe. So I think it's best to keep
> it this way.

Thinking about it again, I'm a little surprised there would be variance
between them. Can you do

`cat /sys/kernel/debug/qcom_socinfo/pmic_model_array`

?

Konrad
