Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35F3F8EDA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819220; cv=none; b=R7wVEeMG5uJZg0YZFWtzOGA3VcoQAvPPK21V2ODb9KVIL6CKST0z7Y8iHzmgPq+VXX9UKUfoAK6xsdolBawz2hZrsEzoyF7dmwNrq1AlxkjCn/CUqzXUdQnnijc+4XTiTv5NN5JVy/wEQfmXcmnw4/8+NDvmk6v7Awa18azIRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819220; c=relaxed/simple;
	bh=l9RlYtqbFZk70E+/GtjbGBCq+MwRPknGUsrxHjSxMm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svmnVoUEmwnrKDKexO3rujuOzJOAauPH5cD6Kty2/LwLZYD4Ul1SNV/CEOCXOU0n+9CO+lmgMmwi4miWui/SQkK8rPagIHp6pltYYKn+TgLnQlYJSTGUdIsm3fdmIMcpH7Mg39uYjzCDw14E45FFwNVTVr4d8UA5sfAYd4UlUFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBDRS8MK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cn3kkC7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBDRS8MK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cn3kkC7R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtF31522278
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wOCryQXLht4LcqPVS7Zzx0jUrFByxhQIzaqTBMnaiw=; b=TBDRS8MKEyZ2sYIH
	TIr8GAAAspb9WyYEkpnzBtgKmHH+TC+EBL3RKTMxJZM7y2VUd8cJlel7qhitWwRH
	Lt9nGbOYIKgKle34ZRWihTNVJYJR648sVfcD/N/FZH311+8AarpFiU2oIjOK9DMB
	mIy+0lVYEPsekAQ/haxMOYAZKMcVWoVxRW1IgR//+kDK116tS9VZwQlHiQyNEd9O
	+jRDRFXrX+xPzVN5v19gc3xwkrCy2htx5uuZiLFCYFT4EhqDu4l4kdATW2VbbM45
	V7v4ECoTF8qUZ73WCyEbCGA4IS99e6938JxX9l123wtHmWzBTiG64xzq0GPK2ZZh
	GY30Qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw934cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:33:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so4152751cf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819216; x=1783424016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wOCryQXLht4LcqPVS7Zzx0jUrFByxhQIzaqTBMnaiw=;
        b=Cn3kkC7Res+Z/gEijT+oxSWT8F/zTTZ8qrAXlMvdhPihU9cZkyugkttpES/ZUxHSTp
         1Zgf1zaBtd1xVBHvkUSZGsOpP41sg0O++Ygv3SVnq3Z+n6rrYgpkOzgXvSA1HVHRlKnh
         eNRpYBF9el8hfUHc1Dog9dKg6v6hkl3Wbg14tOA/85S0Dr9/EJqP/Y255sg2vvI4C1VD
         Ma9sjIwAJ7mlNyTyRl3y2ltW7cJ9KjugorCdSwIragGn13mo3ZpDRbNeG9/HY43kK7UC
         qOpHFqj5hLr9ElVdQfjzfPmmdAl48EnX6kKDQfvQuFR3mFxGmiylSFqXmnCJ+xcc4dw7
         RbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819216; x=1783424016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wOCryQXLht4LcqPVS7Zzx0jUrFByxhQIzaqTBMnaiw=;
        b=lM0DcX8KeEE7m2gO/CsAujB5bbu94W7m5Wk6Wn5Vce+fm4HR+HnGMQfA1OjUEYl5Zj
         h55rJ0ByEFzTB8FPTG/6X6u9p7HORnKge9/YM9moucUVCDN7f7NuWfMwvJNhl2kTRo2v
         sv5vvqOSA8q9dW/oQKG//+jvpcdLrtnwHBuPvcQeUAbelYWJEq9kdHC42jFwmyMyo1PR
         eiKfAiUceN4G7ps/r8gYc7Hgxaa0HBkTP4iGM8U7QW9zvve6WoZ/h26TLsPPrJwtyuNG
         sNABrQUNdFR7CNzabbnQLMHFZqdcPpleTLsl2jF1ofr5g7ld2ePxbg2CoCTHNYkVxobZ
         IRFg==
X-Forwarded-Encrypted: i=1; AFNElJ/oI52AxNCBXS9/14Sstrn0/SXsAnHXSIb71JrK4iPymEwMn9RSwnVjw+cRDoeaSMumY0iCZKauJ6wE@vger.kernel.org
X-Gm-Message-State: AOJu0YwJarBMkbVZ37QA7hg96hsGLOTDZLFhm+HT+K5quwMEmRbXzZ+b
	s44mpY6uRb30VexKu2tNvZgiEI95TeExeKLE+J4j6UtBGudp2HXQlk8df+qz/whSBLilyCKuDSR
	ssufUvTiVg9/yxeagYvPCmBfYxXt2aRlSACF+EUe2i0Tj+xJ6nodj/2QYb8MYoF2X
X-Gm-Gg: AfdE7cnwixWWiSwNeK+gz0j9qvtsBthEv7xAr9Z0XE76qWJ2ryRxvbwn9sRk70Crhce
	2EryFF4wgSWaHoYqAD9nMS9osUz2hTobvgwQ3eu/56PGUKn0fBT9HuxDHeDWEtX7pzT9mhKs27X
	XR3dkxsOfRG1P1bHu+4pcy5t1m87mtZVIHYwLJ+QWeMtk3YG9fO7+VzpvWGTnO5JeRii6YH4bT2
	jOcjth5drp2lKqwqFhMpXzE0hENvPxknGFLD4e8WfIFrV1jlMF5A1EYcXcaCvlDfXHdvjItKdvV
	0vBmYfnWCc24ZZXO1togIqBtWL+xphWZesQtWYFouhqm1elTolFe2X6XjxiKVgK5sYV+rHDJkId
	j/ika6CU/tds0p571ijpkne5EYLibBB4zSGY=
X-Received: by 2002:a05:622a:510:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c1081930dmr25350411cf.7.1782819216292;
        Tue, 30 Jun 2026 04:33:36 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c1081930dmr25350031cf.7.1782819215815;
        Tue, 30 Jun 2026 04:33:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc89sm109562766b.36.2026.06.30.04.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:33:34 -0700 (PDT)
Message-ID: <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:33:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNiBTYWx0ZWRfX8Ht5MNm/rpKo
 Klv1QfVkyFFKzNcCl7a54XtOgB89dGyMTjpsnpwnYioOHhsQuxWmC1A9fu96UC9A0FO6dCy38Ir
 TsyvQiYdJh0gNEvG4y40GrxuOduaJ5A=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43a991 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HIlf0Euc_oyIobYlzwoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: z8sIwjbNBpCekyn8-cTr7fKAtTX2429-
X-Proofpoint-ORIG-GUID: z8sIwjbNBpCekyn8-cTr7fKAtTX2429-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNiBTYWx0ZWRfX3ERKaMJbJp5q
 j4UITujgB1cbnVlWxpA7IFowGO0iWY6IQ3YjnTbgDPTY7/wFihAWzp/mOh3aYspmdV09IRMnPVo
 /T09a+sTB7ew8IaO/nMoO84WczAeAsu8omsaawno0sVTudfmIXnwttPXIxwqNW1BzwJLrDw6n3o
 m1je9D4j5P5jaQhzh/G7Q3JiCM3D90y85me2zZ0OKv2qJhWDfmi/m+O6T2zUAQlaimyCA+hx1HX
 qFdxDQne8rwo7XZcsmA4O5vny3hrLpvZ0ocapwsNI3FgJ6QIwxUkc0fUoDkyKVZo3ObnxT4cJZc
 d2DRD+Ilrhkm3yeum9NbHiRNRCErXpF2sHw7p+fg4u+IV23M86oaMB+DPyjZvA557MmgvGLrEUX
 vIcliEHTpBpcmwx9j0G5ihRpIrRGkTVijP+URDqt1ErGE/kiJDjXi5gB3OokL9t2kLEX+nEE6Fu
 CEDg7erttL5IhuEYw0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300106

On 5/29/26 8:02 PM, Yepuri Siddu wrote:
> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
> industrial mezzanine board when populated with a QCC2072 Bluetooth
> module.
> 
> The overlay configures UART4 (gpio16-19) for Bluetooth communication
> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
> lines to minimize power consumption when Bluetooth is inactive. Host
> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
> SW_CTRL is mapped to gpio86 for power sequencing.
> 
> Disable UART7 in the base industrial mezzanine overlay as it is
> not used when the M.2 slot is populated.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---

This seems to be a single, unthreaded message. Please switch to
using the b4 tool for submitting patches - https://b4.docs.kernel.org/

Konrad
