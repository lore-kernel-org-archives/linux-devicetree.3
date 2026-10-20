Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498384;
	b=eT0aecHyCVW8e8Mk99VJT5pdrukp4OP8DNh4ks8GzogqntgggyDWyqeyIUWCVdL2bbqh
	 ioosQN+NMNRiAJMq/5NXWJA2OEkXmo8ks6Ew7BhFg+ygSANz1sPW0sT1BrtqZCf1VClQa
	 Q8DLr7WdduN1J9aR1WKo7XEHigAsnyRwDqusaNOMIs7eP7bpWQZC/6R1KuXTBrnP1bBAK
	 aGRGGjPjToyjHdrhlPe1yXvgjjcjbHVEH4X7DhmI5s25n938I4tchBd99LM6ede3xNOX9
	 7/FRgqWcksKYbrb4Mtt30bgP7iD1WMJw3qexwoq+/+s87rRjz7WqUaj0dOv1U0CclVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
	b=bkecwsk0pnCvTeK1lMlIgaHvikhkFxEzQucm+YzI+Rmis6aKpgVgdWxLQC0y4Ia6tjIi
	 ZKzUU49JXGBouF5B3Q3l9rCbS61yWQElImlRTkRs+wUZDBoGNjyKGmGWocmJibc/jxbxr
	 B12tkS32sA9qi1nV+eH32hmNEWFrZfJnT5CNp+ViH65KnI9cSJuOz86eTnkw/jn4HkMZ4
	 ICKIzvQYfa1zj4LC3dpejIzT5eIpXOcA8voedm+fHTy5q0qjjpeE3cR2Hwx6twCo9khEz
	 l+2+4KjK1d5V/YYHeN1Y4ZeaWRlrkboHF0wrhCZ0dVTpgkuaNZ/7emT2K9jJdy68OMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYWZGR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLmXifFA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3C606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYWZGR6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLmXifFA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxHh31292864
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=; b=nlYWZGR6bF4T/Kbn
	yyjan0QGcs6p2vpw6wh0H5ajn4DHki0Fg32MYd2pWRuXS72/Cv1qMHz3DZpWxjOC
	leT03jaeUUQFAUL7iYmXUsj8IrhB8O0Q6/ZY+nF9Dueechv/QTHTeIKtNw/fZssD
	gT29WqPWFuDNdW4yyeKOdFU68Mxg+2um8VeYi9mOQGCrhUMenb4uX3He2BXwBPvO
	jczupB0aTzAP45l1LmQkWu+Hyz1rULlk+MfETpRs0m4lulLNj6rn8pVkPJ4/7WeH
	VeYsWJ3x56BgZKZu7QOaXTvGxXKoJgW0cwpxfQNA3wa4yMTETkqg97V4LkimnHP2
	huUeqw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:13:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179d9bc964so8953936d6.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498382; x=1793103182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
        b=RLmXifFAg4qnhvK9FAhtheyi8hr+AI4BeWZXF2aaBCq9/71ftjK6+b1JQUK74hhRCt
         DKsZjewjvsKnuZz1v9HeWB5NG5vbAdZkHK5YvAYsU0pI9koijhprjLm1V9WFLmxyugQP
         sgTcf+EJ09SKTJR7LLqBpexE4gjQ5AW4pkwi1HJ13uHXUlI1N9lvtNKD/qZCOafKMqYi
         ouGaWMlQic05Q6YbrwfqrkF5hkT39hRVYmKq+/OTBl0BCGWg3Zon1Up9ON3vYs+n05mW
         VIb3ZQenql4u604EqlErvsbYXzW3emIXQpAT17Ev0dSlisQj+euIh292lpFKWRGkTkzC
         3OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498382; x=1793103182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
        b=Ps/Nd+X3H1hLoUPYcyya120wRpZbC5M3UsoCsWgjmeTtdyxaa+/CP+77Cm0sahYXyK
         T7LGrFou1Idf1Kw+FiVJq/51WAY880EGv1/PC7i/LWiX2V/N7hJcRjriYtQyV80P6hKx
         ObnmIUKSKvJ44DmDvkkB7PTJYjb39g1MD1MwAfcqumlniFF3NiswQNY5xOhc+1FXyv+6
         O6D8ZFzeJJz2yYHdId8G2T7t3nSfnU/w7DTBdwP3LoUgj9M6sJ9npgvQtGO5yfcAF2si
         KYnh8dqt8HK/GVgLXlidEqte2oGBCvsGvLFmaz46EZc6XgFsIlqxx41B2Q6RmnUBc0GZ
         4o2g==
X-Forwarded-Encrypted: i=1; AKwUvBxaXNIDUluLPl8BgK0L808jvuKRVktDSaQPu5eeSwpYFYI8ANwVynNqv4lhpz9wkG/LqAAogIZcgtQ9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3xlxIAHkavQoyL5t7fHAWtpBoOQ6FaDvPZhTpnnZ8WcgxdCL8
	RG7/dUNMvexRabdTdnU2epABE6sDlKYeyqze4fx0SB/UxWnqdwbnFuEj5w5v9pEk00+M2YdGjxP
	iEbxGf0WInnHhoQNRbe4A+VBBBk7Bi982k5ieg0KRqXmcA0qCsU8YM616rFNiWhbt
X-Gm-Gg: AYBFou11UODQHVA9nyapkAikswW62AVJkOQYup6MGOV7m8QGX06cLyommXpdn9V3+h5
	kI9cxKaB0wcLuiQXKv8fSN7RGhdc6utRAc6+SNzTAlY02eBC5Fgzip0sZ2OO1o5VEzW/IKTUgJG
	KHfpmCKEzhW0Avj4Ku1vLzEheK2o7XBXvSfaRCHIb2z3GCp5rRGTwgSTMCDaLIwWQwt3FaDWldh
	HXPLPVotD0i9StjUXZ2l3JVGSMGWYy2EPS/fL/uKhu8krb3yr66/5bCF+ilnE/04PdDtiNJAkBz
	lekRCHs6eTr+Oqz+bAFy/J3n35Edvqg30L08nKnorxoWmysX7TJjaQ8fKUy5l+R0fAMl6SoaBWm
	ZoN/O5PPfm/TKN1lMNL9eqw==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr2031675085a.2.1792498382008;
        Tue, 20 Oct 2026 05:13:02 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr2031668885a.2.1792498381498;
        Tue, 20 Oct 2026 05:13:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm5256665a12.33.2026.10.20.05.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:13:00 -0700 (PDT)
Message-ID: <6257f715-265b-4a33-bf44-5f5c5449f046@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:12:59 +0200
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
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GKg8jgqNNoFHcOQcBPCNCnUQ6Q5duucF
X-Proofpoint-ORIG-GUID: GKg8jgqNNoFHcOQcBPCNCnUQ6Q5duucF
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75ace cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fHRsoPW1gXWW0LuZJBkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX3U7Id7mmfXAp
 luiviEfVOwDSPoqPTwxC5GnWVvpVLH41g4GK1EApuHG+7fchAyPMgOPbAfgYgXolvi+Sl380WFZ
 r66qKAO0Xrz6YNtYu7mPCc64rkCW8nM1Nem6z4aqTABr9M8Zx85sgV2A96Ug+0X2ym68mjXIGXk
 oviIXFbHRXa3iMiAweVR0SR2j4VxwSH+/GgD88Iwcnbzt7TfzsAoKYxXZ1cUmDIHV20TRWx5w1+
 Jm0lmOK1UINOlJAUQwrI5p2IF2BF4TGpVccLkV7Vk3FijCo5utWK0QahAXE4HAsrwuYBcS8QIcK
 vH39x7wY5qnvbyXftCfJVas2X3+XEoMV4BuEQK4+gLvwhuWRwkLR+n5wvdUU5PwVgczI2AuwP8T
 ThfNQoh6yXFMWVvZiqU/RwfYHtaJfkmDwLhst0c+wCYAZ7A1vm1qwO2cZZ02fJKC+HNQRA9+DNe
 vs25hvcTbvvt4vGbUhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX0q/0B/cFh5kK
 ukyYieuUv48E/427c9m2DGKCOvZPN5xfISd04CwUJ9pOqpMCbHxSi2pFEGnvlBBd4cysD03cVpk
 g7bWtxaiywn9ksVac1gon62awTmUM2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Add label for firmware and reserved-memory node to make it easier for user
> to override the default configuration.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

There's no reason for this commit to be separate but okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
