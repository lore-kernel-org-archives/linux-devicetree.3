Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F6370AD5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887992; cv=none; b=Qi9XQUxDt7T8exQhzIiog/a55QzMfKU17MvPzXUK8dKEmqkdwKknLvxVMePN2BL3rORYdUPSCC3R/JUoK2o2UwwaLh+1b8DJiSrfZ6WVw2YEZYt6gya3OSc3xTzTB4x9ckQ4Msr5x55KPNYP/bTARRWUlg7/dxWTII+G2Ub3kEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887992; c=relaxed/simple;
	bh=B1N4qNzJkPnYUi9FXjghrB4JZoPmIHc+q5v4wRfExDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNP5cWM+V+vloQ5RW7+u8Zo3oVCYjc2fvn4fm6y26fowfaJd1BsvAWMid9DV2P/yyeWOEeT6VDI4r8V1BZtVIsqPj6w1n03Kb5MPi22P+PimadVVk9MPJyh4itHqvaH0EWRzFLvm3OhXkp8aMSFH5YOe5/ozKr5gVPAmNdIw4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS6ANKAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsyWw6UL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS6ANKAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsyWw6UL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xbOS1892559
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=; b=jS6ANKAKLoEElzbP
	qePk68ka4Ec1SF5wzii1TpVeycOQIN3sAWujKfIH5u9coK6EEDxHTJBIKlnRrbcB
	mrRnUQwvb85V+yUuqfzR+jeZq1H14Mx8o+39UgtgZ4QYQVBeWVKc13ylqbLhu10S
	9kSn7PSMQnGz31IuFEHVaA+7HTT1aRD2PXNhqnN+aUohIZlNXXrvDxVFFZWpvKcW
	l1b1c9pBQlWxQNL56yXz+7Hp+4f8ENmKAs3pgWfy7pZ9t1Zd1DFqw4+0IhbEWw6J
	0ws4Pc13AcqsugrEHyatxJ3mZ0kj0UTh7DRT+muqcrfhH8efV5jr0i7au9ODTAhC
	dgHSog==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx8xvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so525241cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887990; x=1785492790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=;
        b=TsyWw6ULfxC1Rs9mqFd8WBXdHbhqCsn52uiXG/yGoNz6dN0/ezJR6MZjVEn14YArwO
         YjK8Ay34NfXYnxMaZWSP3/JWd7yNBBRFxL4EG/OD87Tp6z2Y7na7MUTpI5hmX57zzrkx
         WJiWhpa8+wDqKOygBgbVdUC4eRvqniwtqErjUaFNCItbE+fSYCf/9gxrh18E8esKnK9L
         j6kJFVfe4HZht521WKLnYUfpxkX4psRD3vJddfVUKCxu7A0Pz9/2brS+e1x8uSJFG87+
         Ya9OXD7o56sKJaVLhxCdCMgYyg1x+ebhQYkVhO3aIWHQMquIQ+YmfugVlZdWF7L7kieT
         5OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887990; x=1785492790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=;
        b=Bh0islkVkfs1ssXyuK3rLBR1NtK6Rxe/s77bbR6likUM331Ugf6qZyeMjVAQN7Qiwj
         Rhb692DiWYJ210cbab1xq9aijK2OdiTJuayNB12cgydp6v/Jpx0o3drPBRlsB/jN0X6r
         2hsu0DTkSpNfl11Y31EufYVf5uGobpyeyk4lPjq7CknnSpThV0aVbBa7k1W9q40V1EOb
         OQ58T10jWNgaqxYDvKDMyoU8G9/SNovkYNX6RnNPYsS087rJ050jEoOdGulnqIubVpUC
         mh9RABWF5Ya6QV6TEXdTsVAc4/jpAh5dv67NrahwUiq6ubSJdWaCUO1PU2pCouIcUh9t
         utOg==
X-Forwarded-Encrypted: i=1; AHgh+RqSnY6znbSTPysuox0RtPfc8rkN35AMmLD7m6vEf7K2asIvVdnIBxBPD7z18AHH3gv6FOdpJp/KHIQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKhQqhSbP8ZFOIhrgUSqeVXKyNMidGr1y7UCK51zGKH3+k1Ry
	Axzi0fPSgezTrTkGp1x1bfsLYZppCRZnfWTo0OX2JByCkpNoYNrJHnBxDpMsIakqMPNM7xNbR9k
	Vrl06n6FxUphMOmBcTl72Av4VjJQpNcwqKKCy17CrDiwPaxUYUW6iFKyADtzI+fOO
X-Gm-Gg: AR+sD1227Ae26NOidgrCx2Udv1KRcIfUx1ByBEW6sCCYXhDPjutfn1j2d8jJzF0VsSH
	HsRILQNQcsrtTk79VZBomHjr3ee00qhZs5B4mReNJ9nUOw72WhPMGRy1kFxg6nRj7X/H9K8paWV
	8+RiQxbVVoOyIhDXOdOaYMEsVAnrxq+/KOgfnd5lEgo01e3IUBk7jbjeX9wo1KfTKPX7djI1TRb
	HPOrpdFldRgC0KE2AD2/TDqDVN5DsNI1HDO8y7JDEokbjf0VmuVknY4SyKBvYcDKgXqoRDgDz+/
	+od5dYe3ma52XX7i1qws+vef4D9KPA98YAUZ8+Zqpb9bQxfwxYlZTcaqJT4pRHVi+8oti7CZJ5j
	bUQqcff1kgA1TDhnRavCR3sJ0
X-Received: by 2002:a05:622a:4083:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5284972d05fmr26024131cf.5.1784887990069;
        Fri, 24 Jul 2026 03:13:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4083:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5284972d05fmr26023881cf.5.1784887989691;
        Fri, 24 Jul 2026 03:13:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1a17sm3101960a12.5.2026.07.24.03.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:13:08 -0700 (PDT)
Message-ID: <3ca51329-d84c-4c2e-94d3-71b771103584@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:13:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
 <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7UGVC85ZBg4yErLbbIk16Pmk0D7aXiMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX1yYYAZWNOCVx
 jovYvZEUd8A0x53aWfGJxUr8dT4NIf+J/0znCWntm7EOf1n3wOUBiZRlfuNYQyvihx1hjXdL++f
 FeQ1Hx/ueahtj0NaooPgdz2W1UGxqV7wv0c7COrtwfdhmINRX1zJz3xzhtQxMMv5oZNwOy7G2dz
 X/ApfK9pET/Mqmq4guaOFf4Z3aS/c78BNPIqMT8lTNXokIjaR6Z4BFWknNgCrIoMKLGEW+iiNi4
 qvXXhW3flNFhP3KJMC7fHxnghhUavBOtiIhTto31hw/veDPHxnfyz1yIoKUImVjQJNF+VPhC4LZ
 s7ADo2dZFhgw84piiGwbVwM1X8lAnas2QwmVgY6zSaPEmVohfe0h8PXhKfp6IzeZrNhnLrXF/Ia
 +3qDkkqtJRtkLeeIeGfL/x6q97UVytr2BX7zxHPAhLRuDGuvPmVjvZ1+nLLiiKMKXhw6YoX25P3
 Zz/tUVSR/9slhwWb7Ow==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a633ab7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FjjYY-ANMnpf8f3CrbkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7UGVC85ZBg4yErLbbIk16Pmk0D7aXiMM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX/4gSSU4/C8/V
 PvmakJ/dbTQX/leRBRCx04MXOM1gjNWY2WYIvq7ICcxoJqtlAWrCggyIhafyOkd2n0SAommVL9S
 CaUTf0Wr2osXU+izEd7ffz8xKILPWJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

On 7/24/26 12:10 PM, Taniya Das wrote:
> Add support for the global clock controller (GCC) on the Qualcomm Maili
> SoC by extending the Hawi global clock controller since Maili is identical
> to Hawi and has few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
