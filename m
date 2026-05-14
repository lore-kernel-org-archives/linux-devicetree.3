Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113E37FF46
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756308; cv=none; b=SJhcN2deeOcvlg/22qe/JTkk9by6xmTHhh0my8m3745GTdSwRcjFpUx7lXsYT81IhsZtQqCKYjrKUtiV9kKA8MVHs0OoPKYQUtmH5eLtSKSROFElqpE5ho9fEeL59ThqRPJ5OfZvs9t4pccC96kVhQs4+7HiXarWm+kv2oPP9TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756308; c=relaxed/simple;
	bh=tio3jV8JncTrXL3lmEiYq6OswxZqEopi5Rr9GvXcxrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6rONbY07GGF+uk0um4IZhTdCWlKouo67g7uKBBFd5pan/mw2i6YYmTwXbNoR/SHrQujAlyYtf99I7X5ThI6mOWsQlp56deX4gh2pJW+kg0H0OHAfUdovkoMSMIvpzqA2M+j4X3oqdwtuMzaQC6UZQtJ9NNWR11bGj4ujZsbnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfBg2xmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZb4tUi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfBg2xmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZb4tUi/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9lbsX3704187
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=; b=TfBg2xmAmNv6MCNo
	3ULu9CR4Fl+XS607s+gfLtb0P2kwgxHhbZI/Xt8PrQJHyLHCG/YkcWABtlWJDEd7
	STKXpUYOllfCydBOqNjBeyBDopdbYK5eEIkXbBguUL0QGCN0tB3ehaxmzPzn6ciU
	swp05WR1fTcm89FPZ9VaQtvFslC+PiUBatmncQUbIdzenyp9l5IdNacaI0ahrHt+
	H9UhwXK5pG1riIokxOJabMlJvle+B600rjee9p4UuDih/7tN00aziiUVFAmqq6HB
	F5CUb7z4qB1O0rneqUPEPnJUAwkvYnXiC5MkEdYVDaxM2pxSs5fq49VOnW7leeaS
	l7EpDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kss7qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:58:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f5edb7516so55255385a.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756305; x=1779361105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=;
        b=jZb4tUi/VpddjLcYhLB7JRyqccj2oVQqBS2F2AMdcQ2QUt/UuDa1QJlhb7qTyECBl1
         o3z8USSfD2J9WCB7UIJspejMCdIBQBH/CS1olL5QfT/6O5zusMM08UzOhjIMRRbuOhoA
         rPa+y2KMDF0Z9+byyjU/ZEEXBI8rvT793deS0YMLB/1fWChkn+r6iQSo2EIAvkzbbEEA
         EFxFTC01KUdEBNkR/R0NcM/1owIa/3NsNXqy/fuSUQn+tmJtwhO5pae71fYtTIwPbK5X
         9MJqBvdIPJIuFCq7rh9CMv8mE+pFFMewbLkpfKzG3QrKGllsJgbS8UPhvnfJhWmyQMwV
         IRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756305; x=1779361105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=;
        b=D2DW8ji1Lq1EaCc8Rz4Fm7XE7grysHzx3hh0niCJLsd0IU6PCdJ3YbkJ4vkowWjirQ
         nWKB5Z9rYDdeX6riFf/8hMKLH1T4ZbumaTeIDF4iZkC64USOQvKCl4mSHbi5gsgj57VC
         HZNJuExVyjNkfIzTY+CyJRX/tiSPXYCIbLNCM4OLrY12EUDjSwqnDfJDonJQMOSOzHX/
         90OHc2r4K/k9yP5MU10HopBek833qA+/11k+PSqM1pSVEHBlaKq6Ofzdd3Y9IOKuTNdq
         j9kLvTcX+6GOlwxZmvwVQPr/mtMzJ85t2X2X+keG3ar1rgnWym+bfbHtc5nhMGbcx2g9
         PGSw==
X-Forwarded-Encrypted: i=1; AFNElJ80RsjZvSYJO2DZ8cljGvM0Vyf5+hq/48SlY0vo8UqEggPimVshMLC/AXkd1IMWQtnzqhPyYrzvFp8m@vger.kernel.org
X-Gm-Message-State: AOJu0YznNNjglbsL9I4wFb5d+JNddUMxzKQXgeRRsibajixFUxtQGfbW
	Cbdb1PTaXb/7KFXDZikGMUu0Qxjy/R1U9TNezSFUJBxlr0aFDMySFuUzDIGJIVtWAF++StSMFUo
	cW99cxxME8316Raia+APfwGbfsTCr3mXdvO71f+KBMnt9fAeqZtwjehs/9uTWuJov
X-Gm-Gg: Acq92OFzekRMVok6ssYmaaMbNvnv8wAhWEYblHOCg/YlRKXilWRwhkIX8h5PGiuhcJ3
	GxOeDO+80DNxW5bH570rFWK5evHSj2AI2tUP6fqMKvHSrnYgUPil+YJxifSeDW2dQtWpv4tK3z/
	ubnnZI/FG2dvEVn02Dq9rkyTLwNxhpNnNQbJmptE6Z0eE7yy2SdmavO2TZuzpbmESd2VzRLfx5G
	bkVwfS5boN1OR5F0ioKH0mqDrcHczBWdimWMl5b9ECZFQDWr5alM/PUbYoe2u13pn1RmNelQjLm
	rgwvawCpSKOlAHBHBB+DLadcLIj7htQaR2lnU5E1fwrIGq36UWmIMBugmWjMrmOa2KrNCjnciWu
	x9PtYS2h0MHLpKWYN3phqYhHe8qhkjWaZA9xiLy8GZYlVSk96UGdAyTBCr+q13ardCkyqsyJrl3
	5GOoo=
X-Received: by 2002:a05:622a:156:b0:509:39b5:a977 with SMTP id d75a77b69052e-5162f64a2b5mr72359921cf.5.1778756305307;
        Thu, 14 May 2026 03:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:509:39b5:a977 with SMTP id d75a77b69052e-5162f64a2b5mr72359701cf.5.1778756304841;
        Thu, 14 May 2026 03:58:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:23 -0700 (PDT)
Message-ID: <c892df0c-1fb1-4cb5-ba17-4b75aa52b214@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Romain Perier <romain.perier@gmail.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-4-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Xwzzzoh02DFz2nhANC66LYAt6IW_FeZ
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05aad2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfX/z2A5uflik39
 MR4raQp/aIDIvWMjZg5hNmDEnPedcE+ha0NUsi/bAQfJX801UZHNHvajQ/NIVT53c7Z0fKkXCH9
 NWBl/hEbBvZhE9Rm9/gMjX1tZbp1fXpep7/FhC8FrcVXoE+/LgkvbwVE479tnuZKU6E9CJjrXWU
 VPyPyzBtEHquS3MyIMHnQJTViS0pCWLwpbYABrRqsyyILhS9YYujOrSq20fIovnTqKhlAaTjNn/
 YeXm3RiHNjed8zl4Zlz7VqCYBm0EmAftG5bHT6NXgIAYiywnm9kUU0ai05dQs/V7QbMLOuY2nC7
 d0NonnH5HQqmEqJUDQKtrtRlcF5ccZODVX2qbuYsvnSejiXwBeA7pSYxkxTrrYIDESgTJHrV4CB
 6r9tSX5h8eWKK/kj/SsNzwKudq9+FFMhFOsdn/0/Joc/DIh5aPFo2+BRtP2/bHPLGNQVY62OA1c
 XYlwTI5K+kvHJ11MeGQ==
X-Proofpoint-ORIG-GUID: 7Xwzzzoh02DFz2nhANC66LYAt6IW_FeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf
> 
> Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Assuming you get the other backwards compat pieces in:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
