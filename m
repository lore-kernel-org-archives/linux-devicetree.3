Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76143F824D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992355; cv=none; b=po5VKSZpiwDXBUMGJig3xYrGs7WMpeq2U7u9NHDEoW5zV0NmRfNN5ejmgL7kG++VpUqQXxoP9k5iDG5IS7GBXaT5fvPmI80g9aVxy0x29EYq7VPH0HzEFcwDFpuqbwfQ7RyzvY/oBnNaKfZ61vP5av1qWgiXNPzzUbUv6bzwz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992355; c=relaxed/simple;
	bh=kQehRj92eBRz8QwwOFmUzIDqUigBIxa6Z7mlG0LZLfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkItuCo+F/1pLtb3tZHbeJcK5GaIWR+aW852lIoD00xXOX/gzkZdEVkD/WA5519vpXwZFyxeoq1+Q8JJLQf8ma27KZiYKANh0YDYdLBDXxRFFa99rSpFtOYMGIs/jKqYyo0K1AEXKBTfGXGStvBzudOE7h7WnDh0J2fsM2Nbpkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noxFqKLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfSBJ6tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noxFqKLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfSBJ6tr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe0OJ934293
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RvXFuLMYB+JDbIDsq7Wqlrnw
	BTPym21ZH9JjLL3suE8=; b=noxFqKLaN+RonhN0jkOCyh0+j+yyh/m4KO2KwuTZ
	pLK6DmjtTYhTWFXns/p4AwA7MbXxgQRC6f5wG4Q+rXXrmJfOpeA+U+RDfQK4TDXG
	IL3uPs8E0vwRGHCJIXTOaHfiZFnDI/8vo8svxaWSzhwQrgNEwrtZJR6/9afDfrsc
	j744KuoSLQCdO7omomX5RzXUoUWHxnsC70P/xVkklNr5yz02xdFqodKq1yA/HzT2
	La850fkVvGFDUJsvEJLD2CIqYs8O2ffaW10UEqm4LfDzOGTIeZFzxKpfvCXTWHZC
	TnB3Vl9dPd0JhpYPtuxRVlxDuvcdtPECg95CcAfT0A67jw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bagrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:05:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463bb2so713814137.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992352; x=1790597152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvXFuLMYB+JDbIDsq7WqlrnwBTPym21ZH9JjLL3suE8=;
        b=BfSBJ6trDeVya6iKFRTzryZe4fkLc+oySr7orOiVnNsHkWnjo2gs0uCtkiAGErguPG
         vqvVFP1DL7EWu0ChP5BLQLvch0lZ3/x6QGCr+ytE8qvQcsEizOnrN+hQ4qtlJkPyjGeU
         h1by8MXb5jHd1uKcMcGR+qSkyH0NDaZS5EpRmIN1oNHzYdYn3AbxP84wgdEEivpbg9Td
         U+2Rr1bKjRtAJYY84Ma+XF7Y2P1Kx2yF3cofPI76ETTtGMT8pR3UtKlXFbUdYegIe70K
         kK697d/HW1MQ/dFkb4oltFU2ITXH0TPBQ0BKOy1b0lwK8iikI5AQDS6CyFms3HEiBJxc
         mjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992352; x=1790597152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvXFuLMYB+JDbIDsq7WqlrnwBTPym21ZH9JjLL3suE8=;
        b=Lvz1OSL1ZSKSmwvwatRliEtdbWft9IZAWAJCcqGjIYf+fb3bT1YssUaRssxREt8hrF
         qrWSE7cG8IK/aNVk7VYutHWVYEOMWIbGkebdZOHlXVeQsZOUBwykSouEv4tVW7mpeDmj
         FbKGTyLPNF0q6YbUPIqFxKCWPZR08rUzRq2Ujr7M9dxrtGSPwNl0GsXN+SoZOee0q2rw
         56LemLDPvw4RT8XuAl4UoyYfOFsGWJuFLwMq5ohBBSLv8v11/JMENdwAsseJNZsG11vz
         XIhiv0IzTUikEWX/kEErUIrp4t4/4it8OvetW7Jrwqb3+pUFTcLs3u7zSEXSSQUrMWyl
         pCbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwyEhP5ySB9nkYrZlR48JfnplleEnhZlzLNzXekklH9kWAHZDXisyW1hgUDPvjw9XSmXksa8Ju8jzz@vger.kernel.org
X-Gm-Message-State: AFuF++mCQy6VJHNL9xUAYlC6w8V0gLeEX1CxMFGgFzvoQr0zAqp2U1zp
	ZAWqAQiOMVZ8MnVhXfvFHs4c1ldLLVa1R8R9es1kVPZDkmNBLedmU4ItSbGz6WA9OpYaClth2zs
	/ULxJM+poBRF7SXorNGEAmwjeyHzVVkx0TJnh1UMFAKsPqFozNYwgybppR+86pf/5
X-Gm-Gg: AYBFou1MHTSU0ac9ZaZ7b0HDFWq+t2SLkWPHiH5HaP/ESzJOtudlIRaYAwnq23exPV5
	c4rpekXEW7MjkJ7PgIfSa+65imfqGyLSLEUZJcqqYlt5MM/dR2636sYoPNWEpYvpb41f95l329e
	47QYk2T3DY6TAZs+g4xgi/KsnhjWbgYwMMoMONlEfk8rOfO5mYZDD3jMz+tl7jvWuJdG5A7U7uc
	JBeSovLEyWYDhLAzQSpHI74qonj0Rhq2pAOr8HB2IaaAtwfX5IV8uN00kjFGJ/b0xcnM27yDLSL
	21KN3Mt96+Lj10PVC8udYyvCJrVIuapzCHSb4c/rYzsdsOTP/6rrv+eNUuRWZccs554voY95HoR
	xAvtfyYtSVb6PEg==
X-Received: by 2002:a05:6102:c50:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7a7196a9b1fmr1909117137.34.1789992351666;
        Mon, 21 Sep 2026 05:05:51 -0700 (PDT)
X-Received: by 2002:a05:6102:c50:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7a7196a9b1fmr1909034137.34.1789992350965;
        Mon, 21 Sep 2026 05:05:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm295120225e9.15.2026.09.21.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:05:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:05:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] clk: qcom: gcc-ipq5424: add the MEMNOC clocks
 needed for the NSS block
Message-ID: <rcmwuiwifu2capyvur6pukxm2m2wto4sm7xqadphkwxymo5joa@cely63wio6l7>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-8-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-8-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfXy2UEMUmjfveL
 RQO+scx+6ap2hfR00wBR9pKwERQPqwL2AtAdt7ZQh4PK+pbn1PgAjnmoExJzl76ZHRdxmYJKlSW
 RhlgKeeSZk4mN4j17p9U39g8S8tb0lipDqSKtZMRaifgIXXWqb6Fyi06UnJz1HAy3xizIXgOikf
 Y1nLvdUqMRsJKrt1qY0D/D+RPvDDI6UH3SFejW1Xskk1va7EYbREtneqrqk2dGY79PbWlYjvJEk
 27GVfs840xrRa/c9ANPaJAzmzPmfeDRSwjg+x5sEocq/Oo+y470q7k31MJ0kfWoJkK8/cWTc4FU
 SarqqxWJWYuOj6Eb17Ack7nDGBNBO52gv3qpQxIgd8HumenvstB1DAxSHu1/ONyUp6yT1TS36Ld
 DVndMoin44Q1rzYu5Ztha0202RmmWSZc2ZnrDrNoywUZ+CFes0Kwv3/heWHhRskgN8gX3v69+UO
 PTJfSbscUizhLBSa6vw==
X-Proofpoint-GUID: FVRfqNC214KtCY-cXgEdGy1BZpyZv4Om
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab11da0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MaXY4ufcPr-957H-gzsA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: FVRfqNC214KtCY-cXgEdGy1BZpyZv4Om
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX8X08f2pfW3D3
 KN1ms1XO49qx31D/emM1Vr9neZIDuEDM53THqQ36o5eB3mo81v5/XwPYwOzW9aaST/03IuBiGqG
 NaDI3BJ5/auk/aagqYy6QW9mSekiHlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:41, Kathiravan Thirumoorthy wrote:
> Add gcc_nssnoc_memnoc_clk and gcc_nssnoc_memnoc_1_clk to the GCC driver
> to enable the NSSNOC-to-GEMNOC path for the NSS block and expose them as
> ICC clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
