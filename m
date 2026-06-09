Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81C22E9729
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000226; cv=none; b=S+0aYuib+Gr4kNtD3+d/t2vAh5HvowGcRqcfouEePbxxBhTx4caIOL/+AfK5/gHkka969I2Uyqwr/iZw2FAyXL/aCB4IFr8Aza/8op1/CSjG0aSpfcL9EXcNFjCa9bTNrwyhYTm53jS9K7Tf/OV6Zry0zYkxbDuInH1kZB/ppMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000226; c=relaxed/simple;
	bh=60lbSBPHLuPejyGJzFkNlNTtgRn0AxS2NaXpKwq4/9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/lJBMh5iiXLlo0UPPnpD7u7Wj89+cNg03FYdHECsGgzN2kPIvm56PndV2r1CNgtnghaVL3HAk2io6lflgjOGiR0A/mTHJ9My4VI3DmVdJmE0dIjed7akO+hyN1JoltYnBpQyWRk0LO1QqSEhOM7goGOqAXu2x8xESQZ+zHHk08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlgDO/26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5+VleG3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlgDO/26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5+VleG3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vQHT1867931
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JudsusfDtbrr44rlxP7/oBk73rfyE1SdPB/IQf+KXPc=; b=nlgDO/26oEBjtB33
	e3LXmHI/I+uVAz0axQLW9DaSUmE5W2QolchARMtMAxaOv5oCsHMA9BanvXAn2rgj
	Rzq5mUiXmTCa4pNfaKyjrBpcgC3ZoMpdJXTtJre1w8HVbEU3n7lQQn2jEG7xbHEv
	NtjSa71NrurmuRmGEnKlHmteCs0fRGu6YYOy/BtMQx4mmJJaeduh8RSvYmcUU3R/
	L7hLmQ0bL2KGK9Od26tveYRWJxYm4N64xOciOSvHhfXkrW+FXFktHpi5TlLYrYAG
	opVIE8rTihmgBAAboS14MA8z98EGrJ4UFyS7mWuyMX7NVPm0Gnomn33MTNELmDnm
	/PNbBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeeryn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:17:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso3344306a12.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000222; x=1781605022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JudsusfDtbrr44rlxP7/oBk73rfyE1SdPB/IQf+KXPc=;
        b=V5+VleG32ERvBmUt0YSAraRb5W3R5M+snEPbUaVDV/8Sm+8/2FDbw1ECKCqC3TUCPm
         dItXu3aLGTJZ6nULo/IdKg9rdCnF3FKTX7/M1DAjVU5DeKyNUNujI/95O0KQA5bUFNEJ
         +ypE0bb+YTiHaH4pqH8Ibz/yzgho45pzVfHeZhXAXZRuIy4A16imFcBBFVqfAwZG4HQw
         0R4cxBCfVzgwW5NszIlgNxwDdahl0ADGzV5nJw6LmzrWQv/kSA4B8dSPaN+KK2TqBvTS
         eUI9qN5hnejS1IEXN10tLdGpZkeQKPFE2j1j2iVmFvyEc8/czNjiMBa/W5ujm44/iv3t
         9+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000222; x=1781605022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JudsusfDtbrr44rlxP7/oBk73rfyE1SdPB/IQf+KXPc=;
        b=fmRco2Nqohp2TwE9FlYoAWzqjqq5fCOpiJgCSK4hIWd9xorRIF+2+qM9NSwIgqgWtq
         3GDV02lc7QsFUv2rSljTNGqutKDr7Bi5lu/fiKBUrRClsi+Ftp1MKTRvv2ZMOjRyH4o+
         DnayzhE1mlHvET0t4S7Oili0DsCZXEeUA7rYlG7C7nxiC7eDVISChvhXeu61cgbzAwy+
         RNJYxCROPFCm+W6565ebWsqcCv3GCSZ0JmsN7w1i/Y8dImyoaowqUhepE3htSAg6gVPw
         rpbliOVQem5Upw461TlwDRExBxAHhgl86vEBRoIIr5nrRcOzX0tQvJJRnaRg5SZfFo7V
         2KpQ==
X-Forwarded-Encrypted: i=1; AFNElJ942Kju+k8tDPkxAyLLTdYajSO/SzZObs+xT84KoU6Y5F9YSTWj9uRM4+R4gzzvDi7CUrBE8w3dGOba@vger.kernel.org
X-Gm-Message-State: AOJu0YyvSHwak7PD/Mcuk1MSEKOFFYVNB1xyCr8lVBF6WltRUlAe5CzQ
	0YuEwyj6eaZM8M8pPZAAxF3ry6ISDhnGLv0PG/h0YZvc+dI6+Un5MMyGnyayJr1C5wG8WMiuU1g
	mXttS+bR3bw18UN4tWPfWkKz7p0jAKidUDJaxncFt+zvjBXKkE0CuePL5BLjJK1I0
X-Gm-Gg: Acq92OFi5Hpkw2Pawb7oAOFgwq4J990BvInZoZBSqyQ9nCnDLOuYVZAjOJu/uV+42bl
	0qk/YnB7JIg5UtjA/RL70oFUlRkES0Ok7sgqApESTNJeoeqZRkgWft47a7PNWhAG8P2kBRjzn+j
	of34jwtqOiB9jh57y+M4ysh3OqFvwq+yhBY5nbWplAnDbKxK5DcrftBWtLnToFcmJSTEXWzSN7t
	zipmSA0Agal4WWTNxwBtxcwi+HtsX0qrPQIglnGgw0DkcGl9nd82tOhueXVmarrAW52xyIRkw14
	dfIC5sP6yfdbdmlcjTvlg2Z38JEp0S0Iz41SDEYiKCKc/phedNAweQRIJKz/oipm4McWZhBaJ7I
	sYx/1PJBP23tAHdMvm6hqwVyNK7QDBQVgM8kIjzNPjGwNCY/kYl1q9oqCKP8IBJspmiwHy9xcRp
	Wu
X-Received: by 2002:a05:6a20:9398:b0:3b4:640e:f6c0 with SMTP id adf61e73a8af0-3b4ccd77534mr18165471637.13.1781000222569;
        Tue, 09 Jun 2026 03:17:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:9398:b0:3b4:640e:f6c0 with SMTP id adf61e73a8af0-3b4ccd77534mr18165419637.13.1781000222095;
        Tue, 09 Jun 2026 03:17:02 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b374fsm17704239a12.25.2026.06.09.03.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:17:01 -0700 (PDT)
Message-ID: <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:46:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27e81f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qlr8FlQxwEk1uUl_DVUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NSBTYWx0ZWRfX0mild4LhWIT/
 sEupKzqYCWwDTob6C9ROj+ab5U3MPGnJ/Xc4+/9s4FU50Z3a3LbueaYmBTMR33mmWF3OtmuTcm+
 pQBikLU380CcYcVe9u9vBei5yzq0/OHCfymAVZNHoCi+3TfSzOjUytOouVqRpLgVJDkEgUz+OQL
 DpruN4XeNhh0R3Ge/3cpYoqcN1VWHZ98a955hTg6SIIBLhlFzpI0FRswvAsaY5oZsT/SXJ1mKnn
 LaOg6T2nMU0FDn1uGg/E0AuFjPERXoGkw/DfvOybTLeNZq7wpmlB134+Tk+nJwuNfDCuQ7m8SC/
 OWDLWeklxeztS2hPodLDoa1AzvLE62hca4b4NGTJXYE0bbhKWbU26n0zDwb1eowN/kugTDn6ntp
 Ds3tbIgI+RWz8hP9tmCIIKt26960sjcM2IqKjD74awm1Q8b2BH3z1/YPistU7IpuUWXyE3Mml/W
 QxswKVxF563xARIQB4g==
X-Proofpoint-ORIG-GUID: IXL8OpbOsfBk9fuV7kLRjtRn_3u0mE8a
X-Proofpoint-GUID: IXL8OpbOsfBk9fuV7kLRjtRn_3u0mE8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090095


On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>> supply.
>>
>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>> refgen regulator supply.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>   1 file changed, 220 insertions(+)
>>
>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>   	"vdda-phy", "vdda-pll",
>>   };
>>   
>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>> +	"refgen",
>> +};
> Now vdda-phy / vdda-pll supplies?

Cross checked with HW team again. Along with refgen, there is a on-chip 
LDO which supplies fixed voltage to the PHYs. It is enabled upon system 
power on and no SW intervention is required.

regulator-fixed doesn't take the resource 'reg'. May be should I create 
another regulator driver which accepts 'reg', something similar to the 
qcom-refgen-regulator? Please advise.

>
>> +
>>   static const char * const sm8550_qmp_phy_vreg_l[] = {
>>   	"vdda-phy", "vdda-pll", "vdda-qref",
>>   };
