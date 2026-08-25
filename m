Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C23921C3
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650376; cv=none; b=QtffOZZzv6Oo2/r7ZtZtAorU1cHCDExRKZPyu7OTnWLOkHV11pn+kJkHOPIkSZMvjXQVhRnm4TT/wK1h8kN3+OAujrXNypDBNKV85Izx5pNaWrK8uuREWAE7Y2bQyU+Q+C5tApHVgeWcRAZ8Cab2hlP54GNgCVFnGlUx/Vm2To8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650376; c=relaxed/simple;
	bh=aazBJh+cXp5m9zogBLnOI+zVxi7ooJbq4Egp1qcejl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lW8Wk0xpHcwks1Ca8902GpHWEaTyyJpauwnibDHLWYx/l/AEQ6goj8C/SkRRJ0jZkPl3AwM3KrO9YMu2AMh/xi366evDoaNo2T8agJzZfH1Is//b8f6bnE+9Nnom3/UB96yLdOVn6XP1tlC1b5QiSzYNNg/9Vi6r7OO/NuW1G94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePVmwb6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ1KHGqJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePVmwb6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ1KHGqJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88Rqb1163446
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aazBJh+cXp5m9zogBLnOI+zVxi7ooJbq4Egp1qcejl8=; b=ePVmwb6izJUei1Vy
	/xxop+Kq+a6SEgp3p2JAWKacaQQNBiny2U+Db1/08v0Gp2cTE2y34AorX5COLIbu
	KV1oBgnvTQkB7rKugRTFZVLrzshIpIkmlrwSjOTltcD84Id+GcsT4fxrYPwK53QE
	5T0+d8ZctqcvreDbDW0TqYCk4QrVlTNZZ/VEV9oDn3ZWPquqQ9nKGFjK+LIpFYXD
	TAcz8OpjaHxEUQTNM0TuOGWG6c3jym+yby7Rk2JVjVFtdvTX0fVWQn+J5LxlgyzE
	ezdt8swEjYm0mf/kYv3Xzmvhxfq9BbEZIsp/7N9u7bFbRtco25mXADKWQWYHvrG+
	sjicgg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jj18c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:32:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so8396276d6.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787650373; x=1788255173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aazBJh+cXp5m9zogBLnOI+zVxi7ooJbq4Egp1qcejl8=;
        b=HZ1KHGqJKr01k5KdYJvaMIaGi4JlrfJ3LJ9JFfi4+22X7MvjeU2JlWRZbpoW5A6hq2
         6r1g1O9W+/nkHXK4tbvgVKnmVeY7erO5w09CU86Bv6NHwHBEgrLuO7vy/gR5p80nVh5V
         AoglHTMp05SFR0S5kd7NbgPshxNPql+RDh/FjXSFG22WAOWxNgrn5BiF1WLLvXfcr6VA
         iCvfGVgmL0i3lHMI7nA6Zf/CZHQ1JI5rUT3mHu90a6VC4v4idxcfqVDJVx5nxQqqguNM
         GNJN2zbzf/vxXgqvyBetAkVSKkN8HgFz80En+CkSMWiBhBCTt/XeA8nYD53s13dskW6z
         d8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650373; x=1788255173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aazBJh+cXp5m9zogBLnOI+zVxi7ooJbq4Egp1qcejl8=;
        b=Nkm4TkBJRQ9sFF+fQ2vEPTik9hSP8NPqdMYw46ETnR0PXHZ8OEKlEX1cA67zpV3Yki
         ScReJgNyvpdD/E1NkCZGbD3epMH7qNqTG2J1lDZMWAbyyyUccJOOfEJDqRhwhic4h48a
         CN+ieOvrHRDdRE1mZZ+DBsVf0WndjKMS9jSyG6wiQ7B5rQoqj438tEVcFdJDia+q/L+v
         RmjGBYxzNPgz9u1uMkNrX0bxCBFPycOOLlAS6xI+aQWJTdsTi013M5y9S7zwvQ3dRCru
         xazRaIGQvWWqUgqf8gOS7nv9LdATR19XBcJqnQTvToKcVMRxTOqVrfqx59Tz9GsDKEjJ
         7WTw==
X-Forwarded-Encrypted: i=1; AHgh+RqFq4HcMTdwPqVRIHhre3jx297wGz87sgTRQwKNSXW2bA3UQiggLojCY2Maf0YPuc8GpgoHnS3BsTXu@vger.kernel.org
X-Gm-Message-State: AFuF++klK0M1iG7zmbYTJvGxBVzyIj6A+vNYC124a4zmsc7XoFEFKOz+
	4Uovl05pC8h2lVEtQYNTfvA57t68fxE/GgiUDi4PK28JXuAqdJ0/Z4KlVthgqsT5eGszwMfUdPQ
	iJ8F8+lZ4ZmUbnTR/vEI4gYBs6fPIFtsIQHOiLOTlhMIhdsRQWazxyInPNgBcCgrx
X-Gm-Gg: AR+sD1110udf/OXh1x0cS5fDff6q8B+mv9Ojs8g6ak2lQ3W9OLrSFo/+4/cbCX1EiZN
	wCwODWYC4oqO8x4h1jzQvykLBQsWKm9VGLY8TXddwbJhVqpuIWt8YD9c+mB0f7jWESiDKYqg6VW
	yIRIfyOpug9xGCcZ697i9TR5GOHA/l9+PxDzlU8iecZCLRoYtyeDlyafp+RjO9RVw+B2Gxm2CC6
	A57oeh23w6Mbx0tB/fuD4Ofr+Ut9BKWXmX2ntaa1+VsQI/YGBLRrYKZjIBJYQm+INeFroLv8tVC
	m/RGUJJDDWN1IfVMkISHpm6YlojgySVofRyaQTQecSqqYZfRsLZLlbhtrP7uBH3DIgdohXxnj0e
	pXxg5CJymWAby5AQvd6hrQTh8
X-Received: by 2002:a05:622a:1210:b0:51a:8945:312d with SMTP id d75a77b69052e-52df549e41bmr243011001cf.0.1787650372936;
        Tue, 25 Aug 2026 02:32:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1210:b0:51a:8945:312d with SMTP id d75a77b69052e-52df549e41bmr243010751cf.0.1787650372463;
        Tue, 25 Aug 2026 02:32:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1716771366b.42.2026.08.25.02.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:32:51 -0700 (PDT)
Message-ID: <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:32:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d6145 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=WYOYL81blRfMKwWLZY4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MCBTYWx0ZWRfXzfmbeO42ET2t
 tOyG6DGWxxWiSVdQ+W+rkGQPed3FWha7w3yvUsNH5/V7Odgzoo0WUHaKsZL6FhwwVkiWbuySDtL
 i9TXBoy8HQRWnt/ZJvhqJm5zIAzI0OpDq2wiwTcHNVHou/xPCZLETn+13/EyZ2WwOOv5glPdb8L
 qA+s66zxOkCfgCKASijVjO/M842S+o+cmB/KO9nI3VX9aGHeTOS5viwynMABB1Or5j4JNiK1jfS
 cRYXHkwFNltL8YNeXUqSBRXyMdH+VIxRJjrkzkAFrg8PAO0chC3h/e6ewj2lyjVof20NmtZD52b
 h2LWgY5Ts2qfjIBDtqlB7iK6SkXDm/H8NAtOsyhNd46i0nz+AR4OHGKqCJATtot7vaCahbmJg7A
 1oAv6gGrCrnznp9ubLcu4x+/Px0iljlMtavhzdqPo4ukQTWk9mc9lHy6l4wGF+vFuILfoQw6HGM
 7Sjs4pDlC/esEcNIBjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MCBTYWx0ZWRfX0vieI406bS3b
 Drf2+/k1UaYwABsgMbY4CQcre4Hf8psAKWJ3LIrT/FKNoHv/bc+DCpJXKWLLqPDfVLGBGzQPLBo
 mc4trTPCpMPgEMZjX15FsM5O42CJuJQ=
X-Proofpoint-GUID: M58-xcon0nCbppm7IH6XK2sG74IqT6l-
X-Proofpoint-ORIG-GUID: M58-xcon0nCbppm7IH6XK2sG74IqT6l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250080

On 8/3/26 2:10 PM, Mukesh Ojha wrote:
> The reserved region wlan_ce_mem is device memory used by the WCN6750
> firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
> erroneous — the region must remain present regardless of whether the
> underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
> both board files.

But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
matter, no?

Konrad
