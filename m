Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530912;
	b=GNTEtbWEb8hDq402d3cct4/80sFH0g+UuOg1CyNgmiKxZwBjCw1TcTTkAF+DiRMSltTa
	 Nv4lyAkl8yKjmCAkqQptXVMwveVUjgRySuc+exilVvQllWygapkTrEEUwRarSWA/et2jZ
	 bv8Mz9a/9XCSKR+mBUJ70CFQDdUpHQGJlrnRnm3QrbuPJdicuu/nX9czwH/Nphwxwh9+G
	 vGg8/koWOdtFs5bmCRURQ6wp577A5ont+ChDeY1Q2pnCSAiN8nf19xKY4ucew48grtUDZ
	 2+q4WOYzeQNamrk17zLG4/VfPlLCVyrVSqg41f8yAyz9H4xcZS+ojjvb5UEBD6Uyxnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
	b=2F/MdPDsWQlZ7k2w+IGfygCDD1AsLB0YNxwNMAL0h1GOJB477la0HljPZUFeNSHxRrCO
	 +1XSEF5NjIiQYXE+YgBO9uvstGHDoOnQtupEaH++223A3wq7RrWdMv+jnrXP7O8GC9j3H
	 QmDcdcXrGNUgysaJdks9Wkv8vLc09cNARM/PjuD8G3JRF5cbQaKnsDodmwhhZMlN3tNbm
	 soOHzb+atU0nmOEMS2d/M1sbjdBO0FiEtm8JlfeCC6E9fE97dLdA3Jxso1YLPypGmeW7s
	 SKM7S8VS1GB6y/vDpb88KMYpe6ToFS7L2yQSRn4cHxJMUXJ0KELKoKuEBXcEtPhXQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A4606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKti4S3818756
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=; b=C9NNQjG1dc1jZvhz
	INZ5MeHYvQob7NbXk8rKACFzfVBqvffe3AeZqpaROPWbb1yfW8X42Eoclirq1ggX
	Iv6lahrbPf75YvtY/E+SHxCiGDixLnCRCphhgFyb/867QySF5Jq0o0odIg5FsFbr
	+gIx3aspInNHqeVDdXOKw+8zLjlusYIBeW2z9QCQetCW16+t30L23QL1ApdmfpCa
	Qb5ByE4iyExp5bA062UeZSfrBPY23z7mqxpmUwSdsR5gXaifJ5cZ4a+9cY6BveLI
	GhfhEoTHiMjjau0iJCk1e+dK5mwO82b9J8h/PnN7iDLzdeTljpqUM6cX2C4Hcvhq
	2x9wiQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4rmm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso43162eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530910; x=1793135710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=HXsHDjSBN+yDgmGuJrFT/6SYFGrwGDh7Ec+qdvvDvQyS3hID9zJ3maPPULaEgYM9Nx
         eVku8PPfbpIAb415+rUFj7aW9eC8aErrkgcTxLgUpgAylPQ/h65Ct3psJgsJbfVKJBpa
         URBp5k/zAyLaXg508punWFlitzaO9bX+DOxTe2xAvO0wTw9N3fX6ZHZfVQETNxjAU3zY
         zEYvzXudsFNPbXKOVRDZArhwBBS8Cl+PX2oqHkV6Lb8j5+c3t0V7681GG4rqzrJY1G05
         qS+DH2k0Y/kfVtYF2CtVS0wO92eXGitgnIP75MGnT0gV6h7aImEv4v8LOIXiZhElgyUG
         4WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530910; x=1793135710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=eZhXqXpR0DUYb86soBVr3/iRSBN4aSa+ZPE/NTu0mTB8IunibmpzFK5loTRjBdCQKu
         OAtrdLf/Q6rUWtrdfFDEgk4hyT5ADdR6mQt2WuiRlQesGvhvwSl/zeqdb+kiJL3gQMtH
         0D/dQWNIEULS/oICwTwvFuMSpFrZ3HqIS4tbJYACDE4p+HQR9OozHkOa9jlWffetwaFa
         oxsPsXFYGOiWiQjntu6wh0r6OhMjxBr89rWOIiLOUuEHTZMRo/Zkwq82WmLUzm5V4Dro
         yX7JKuX1x6K2RP/NYF5Xi4bJn8vl1tJ7CAYNY9TNrh9NrBmPX5gOoQI9kwdO4LXuVL89
         rb6A==
X-Forwarded-Encrypted: i=1; AKwUvBxD4o9C9Emgj/JoeT+5C+PkoKCI7MiBDTpIrmptU1NQepoDpg3CnykX5Z9w4MjN89bUtKBhmnD2Ej+R@vger.kernel.org
X-Gm-Message-State: AFq9FYICGvsjeKf7PtbBwXaHC1ks/fbaZGlTDi8bGyZxwR9Tg7om0FY2
	2/DrQcw6DXlloOvkQRfMDrunPyXyDe3DaIVsSMQMo0e1vGK4D95g0DOpZMtmgiCXrH0XM/fXQ5z
	eta1AWktY3bEdFPNOLMcH8QpL/X6xgSDZKBkyno0rv/MnEdRrIyyQzE23jVsyh64E
X-Gm-Gg: AYBFou2/V9+oU7O5IXeGHv+f5+cIWe9nRpBhs+CuEsa+N0eD9UsLrodPA6rmP/A1OnY
	lLdWbAoTViB9+IDf8WKr50cKSCqxMOr5EvFUqB3wu2b8hqIXboMEISFYku3F5KMFIMCrTDWvodT
	unznLVnXnRQHiKddxxyzeDawhyHam3FmRNukh3qzWgV03n4Z5pH34EBH4rmtR0e0A4NbRoga/FV
	EFyDDbVMh5DPXU9t7iKKlVVP6kr///FSy0maeE6W1GOKXAsOmO36ys0r5T87cdLOKHkbsoykuse
	tBzIV+TXq3BarmEFJDHGMD1Ea3u/30YGUP9qx76Sh7nIw9LZuTuPelCNi9RJTyA6CaqcyiiqE72
	YqG0LcSIu+xk5vvPasqt11JvsuihDBBmHcbksJNooFQ0hUjtecBOo9TpM4g==
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67555c88.15.1792530910065;
        Tue, 20 Oct 2026 14:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67516c88.15.1792530909271;
        Tue, 20 Oct 2026 14:15:09 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d68f2b1sm980129c88.20.2026.10.20.14.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:15:08 -0700 (PDT)
Message-ID: <7b5392f8-de43-4d31-8f33-5a6d8e0af6a3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:15:07 -0700
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
Subject: Re: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
 <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VhP767hg8IVb2gxwtrD9ijzq0IJAEt3N
X-Proofpoint-GUID: VhP767hg8IVb2gxwtrD9ijzq0IJAEt3N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX9GYuI/MbbjZX
 MjfrZXxLAfhWe28q0vGo0Kl3q8SlrEsdF7CeHhfYGo9F3sHqmCUWatjH3sWAspvp8DBWFK/7Ght
 aH8233Fi0STe2fcc7c6kZ+P5P758CG8=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad7d9df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=18DxlMPwXbuUbd9su7wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX+1/T6vk1qPhd
 qtRF2x2d0te4Z+NTyJlaqKR3IMiIA8ggGjZOhPmlGcXIamaQLbc/R/ZFVL1+pBQI1A5xbFCJg35
 1RazFqh6NGoKg3L//uYqgh7xXmPHvgB3T20Ao5l8/8fct0H1Scrl6e+OciWPJ08vhpdeaoW7xRX
 FohDLoxSmu9b3vVmlBJC5QTRfm2PPom2lWXZcxVtcnRpkqTtPtUEDqdCpAsAuCHnxtho59ASkLO
 71y//Kb/V+Ad0e0lTgfNeIrQnmrLKZhCvwgbi5r1L2uM8ehotYrSMapBiasgnCW31jd7ciF35KW
 UJghyDdO+Icrys2FALkft2JuiinTNuKwbrTMivqtcPSecOltEujfz4osx3HsX/h1FyFQRb9sCMB
 bjoC11KXgpOeWhwy3PoGDF4tM7V3hBeDoaRANIOjDjxuKjRNiSDWNh3MJ9KzqarRdTSZ4YJLH3E
 b4Qq5Fl7uS/bIEJH3hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200084

Hi Krzysztof,

Since qcs8300 uses the same register settings as sa8775p, I will squash
4/7 and 5/7 patches in the next version drop.

Thank you,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:55:00PM -0700, Anusha Arun Nandi wrote:
>> Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
>> sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
>> and SA8775P share the same CSIPHY: in the legacy in-tree
>> CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
>> cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
>> and common_regs_offset (0x800), and camss.c gives both SoCs the same
>> pd_name = "top" Titan Top GDSC. No new register data or power-domain
>> wiring is therefore needed; only the compatible string is added.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index 821c6a0a916c..cef4a90ca539 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>> +	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
> 
> So devices are fully compatible? Then express it and drop this.
> 
> Best regards,
> Krzysztof

