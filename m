Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87052BE5F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073209; cv=none; b=gKUhsvbuSX8r62R8IYpNMOy13EzP0GfpNKWpr3g24Gfvv5xkIc3vAgQEOxd97IwKGF2Lp/mle//zOcLZ5/rdB0ng6bKBHiKxU0Dc9KB9bSmjW2uzKmg0Ovqc9T7Qbs+GTIgNUljNcw6YS1Wy6gN3xR3rGfJMwpTBQ7tPYC4SDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073209; c=relaxed/simple;
	bh=uJsacMW6Bz3Nv3pvumPMN2VFItWY87v1HYxtmx89e1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuFAKzk47aH3Ah5NbKD9sYZVGIkEXz6pAdyLdy/JwkfLAkCYfS2izp38JmMUznWMUzqqRjRDvkAocllJwqn2EhY8G6JF3YeiLXR93M2WhIMOnnnftxROrpaEVAiMEZiqD5gE7FXE5eyE5S18B2VwSfOYTytEHQTST1rAyJiKonc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXMcu0Gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ppaym+Y/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXMcu0Gc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppaym+Y/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTRS2809328
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=; b=RXMcu0GcdXKOOA09
	Ox+7zsR0qqqB2NcJAo32kaQf4xJ2YnaT6FGZzOISloAtoavxkhAI2cIWhqYWjDAr
	1AgqgFgs7KdV+HepckEazbH1Xk16pbcTGSAA5Ub0DWXbwg4rI/ovC50q9OyFK/+2
	gXPX66zTSnl4pekoNOrv/29tqutRql8O6xvoZxn9FBdN2dXQXybcqcrBxMbvZDYj
	ehdxE7wCr3sXAxn9zwF3oOe0h76e1fSZ3eyQ++bYU59h271IZcxjLgh6zy8fi56j
	udmKqxsJoNMm+lVajZatb0bifYX2jutEDLnQDh3fnxT0xdimwbEqBGAhjrCqK7G/
	VzlOYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54txwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:06:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so3092885a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073206; x=1792678006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=;
        b=Ppaym+Y/cwrHEOAiRDmFDp8gHm+emtR0oc3+ykEn/GvV5aSWv5xOrW1ISLP0oaRdfX
         CSlDPLuBtZtCO6dPZu+FpRBEJFJ3HZmM9U1HSpE5cyTDxe66aBqk161HsqUZr4pT8SuA
         4eJTZEbfVIoEeLdeFUs48MpXAO0juTaIKbo+0A0oEgUq+avyMl0DHix1fEOg0bd8JJHT
         y52ZtydQHyl3SAO67MkO57Dnr79L3b0iZkGWJw0bpr0Q0gndvvSb0fV6c1Z464cvSR96
         cTjWY1oLwVomyWu3WTahWX/mzWm1EObodaYSTrjLC0ycKe3DXjLiDYxi0g9QHV9PT6aF
         C/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073206; x=1792678006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=;
        b=tTYfWk6IOGovUb1UZB9kcKVq8Qv8SvxBSuXvTWqG++gHgDI5ng+ehyajhlpyF972YK
         b+9MZAcYjlr1KMlcGA+irWIPLC99lskNtW4QGGBb0kihYfHL/xUcjzvreOrmvWXZLtaV
         bFxEjht9zXDCV+bFaBwE7riJosX6uRdpzGeaPyTG44iXxuybpHS1G/+nzY2YcV9Nygtx
         GW9BgGjh3TrHpd6iO3Tc8Vgf/pBODeYcqiLggeVQcDc6YNs1pFF956Brvd/F3OW051XT
         7olVPL5nLS0LXMfqjpLWfzMAOOtfq3Pv8jBFfTiYkBx88SmIboca56krMLxyi2K5LfGJ
         2EBg==
X-Forwarded-Encrypted: i=1; AKwUvByxGxqVsGJ50PjyfMW9zZxvdheXzK6+Lg2MYw3k0dAr4Ek3hNRZht2FUQEJHhGcRVu4Bac5WJv2sUDv@vger.kernel.org
X-Gm-Message-State: AFq9FYKZd/G4lcPMtUzQa1TgaDaezOlg0wLfXLHhQquSBMoAaQIhMf7D
	Zh4/l/k9tO8Mn1Oa+sSCMI3FuzN+0TpTkrhZ+swg6vIBhLZ0+R8SrEh5qVb5Rg4YMFr4qaBSCux
	2J6ErK4RrEuMexXih4yyDChRTJcIrzks5Ixs01/bAYfQI3FshcSfa1HD+BwcSDLbz
X-Gm-Gg: AYBFou0BK3ht8puXUebAS0/JBoOqzbbrlqICnmqv29M9Y7fLkdm0XKN1Fupp3kF21AX
	ksZsZvjcE6MCQw9O4yolyO42SGFfSQ5dmzaW5HR2Y2OobR4eM26mX5eshCZP7kJJ7lQKUpXcO1f
	SgtlNDZ0BYh6I6Lnm4Or+vc+D6rcSkoNSCXSje1kUFsxbbBZYM037sukNoMfkVIcOBMgO75Klsg
	KkCkn8H6NR8xWJ3gEtPhscLzOrAArGXm6OGbFM4bCXuZQ682Xuxfkg6gwIxeqoG4y4hxslpPhf4
	9pIKecAqd53IxSCAavh+9NAFbGcbwO/Rb8DNPVV4tPISTmeZQtVQurfILhSBZNa8tSqmzRQMEpf
	I+ZJdtOdaL7MtxpyBh63AVQ==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3560053385a.5.1792073206060;
        Thu, 15 Oct 2026 07:06:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3560047585a.5.1792073205506;
        Thu, 15 Oct 2026 07:06:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d856a2sm1370965e87.48.2026.10.15.07.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:06:44 -0700 (PDT)
Message-ID: <a504fe25-f798-4077-9625-70d8fc4a957f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU
 nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20261001-milos-gpu-dts-v8-1-98b14721b7e4@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-milos-gpu-dts-v8-1-98b14721b7e4@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0ddf6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=as5TUAiMO9X00ovHkSMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX1ykGFqkgcapl
 ZBOZjOIvCQ5O1eaXqPLV+4oy2a0DoAGaJEaF3fezsDLPdjF6rmW1WFAhqcNsq3DIWptGRSk5rMi
 5TPhloAcmPdCKmwF537o/jN72U3NP5U5H8N+DZT+ebtQxwHmfz+ZAyfYWUkJcFUkr8+2ceUKwVg
 ltX5eoARM9VTn3+XOr5WBedMP2Kqf6WYfMfUmfLylFg1eYHOwSu4jgjlEMMq4+fLNJe5FS9T2ld
 1qDEKal0fAoewQLXg4paAi/dU4Gvo3iWDIvvAz9BUD2966bPXEb4Z0B3RS7hTXBVqLQp/8PlGB6
 X/d916P1wt08oCa42GNl1AKOvyDsV80tIZO43z1Qo5ztO0qhFEIyh6Smlg1SvzBbJ4Wl3m5pKuw
 M4bqmH2NGiHQYPO23FlU1qH0qZiMIHbVf+xGFNqpt9gied+DM4730pgy9VhzQIggOFtozcN03MX
 jhTIuB1E0wYDii6/U8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX8Jjd32KyyPn4
 EGjPxbFvhdShFDhVX0L8ObllZBpKaA8dra8yo9r3iUUG/dOGHPVTfm/DmiPoiw+ETPBUUNnr2RB
 YVmPFoyZnNBw3gksi7oRDhw5gfUAypI=
X-Proofpoint-GUID: D0IxsZqs1YLVMnJ-0zXBsWmMA2ahY81m
X-Proofpoint-ORIG-GUID: D0IxsZqs1YLVMnJ-0zXBsWmMA2ahY81m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

On 10/2/26 3:33 AM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
