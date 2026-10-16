Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17936DA15
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140348; cv=none; b=KYl02tX/dTG8s8FNiLDdqWjTvzVPrdVFXToJD1OJQOhM0j3C+bEfM4omQpLDmGIPwA4L5EWQi5T4nNK2yhshiM0UMkrsZ4uT++mJBIGz0m7JuINbpmZDdj2aihH3eboXQFiXF+hLiHHDGGJgs9a+DY3zOPgBewC8t4Cw6nNPJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140348; c=relaxed/simple;
	bh=4DWdvYSZbltHTKrrl3zNKEpEpeSmgAfafqI4HEusAwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzTfzIcqX3+tiX8znobRPfyooulgL1b9aVmlgxs+GxioaZr4k4wjw2qTsMXOl+plZcsWAiUdIoni3GB1+GQdW8xBXiatRDIXGyqnQtFsIShQGZhgkzsqON26qgHJXbqHWZPkmRGAz8O7gsx9L5+uQvkYQYq/yleU9e6pcseZpoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUiiExEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0c4eV+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUiiExEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0c4eV+V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7ajEi3493223
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKJUG7T5zsDndsDIoritPt6ZZxWvYNXXCF3jPcsflzs=; b=AUiiExEvmcUDWy+i
	qgPehgXWO+2M2u61szHy5Aq8LQtIhcksrpp2usKk6OIYqaoSo4va1D07zyHKbnjJ
	iQjqKI/PQae+MXjGm2p1ulQTUmFCyLiS33uNjOce9Lp0VaA9CslGeI8YFIGqzvBq
	5G8Sfrle0VA7dIXZPOEafmOeuXrz3hYZ6w5MlI88kpBcTKOeaE2m/+m8J/q10vJz
	fAdx2KyAfJie9D6ZWAGsqbCKG9ZCnk598SafPgiG5oQ/825usgcWsIvl+pLAvSNe
	M9xcfpyyEdH1dMJBYg/QiX09aTZ+3ZRXxBZ3gabh65Sdfis72uTiv53zKycUpXTs
	aoFoZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wudeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:45:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337f843b50so8440031cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140344; x=1792745144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKJUG7T5zsDndsDIoritPt6ZZxWvYNXXCF3jPcsflzs=;
        b=I0c4eV+VUCXG66QwD+r08Y4USeLkvAogM/ulmWS6xsv8/oFxBjwqSaLOrKjWY9Se2B
         M2XwgUUe5Kg3T91P1qI5iwN2NUVwVtasMt0AulnIFZB3979gAp5PPgWBKoZE0FyS2ppm
         2A6cYWo2MpSf9Lxaf5SwvW9pBsUu9502ShFFo+zhI0c13wRcJVObosYiFfN9j7brrjw6
         Hi1ZqXq0FCMom4fDwtesy4jVK6i/+RjaShB0aqDypjjdyr5huyyM72rUdE75eyiBJNVK
         4VjO92/950/VocGyXNdivCh4Y6mKcbhOri91tQyHAFpgQfOiXg3IB3EyBS3LOLGYX7SS
         b7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140344; x=1792745144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKJUG7T5zsDndsDIoritPt6ZZxWvYNXXCF3jPcsflzs=;
        b=U+gijUD+Sw1G8J+FN3sgNX8SDZXpKqxMK/lTyfnEygUK62O0z6UMjGTn0IGl/7JwHO
         9lz/R7WAdBFv/Jy73nVrahiOjzYiQ59FiKr57b7yg2L7/Aa+ouaCwzekRJyo3qNy196+
         m0G8RxNFE+e1QJLGylgzKdY2lM8OXhncVK91HToIwBpM8NNCIa7c/GS+0uvzKWeNsjHW
         W3fPMOy76OvI+aorPS6ioMrPNbbRxZrWAr5Lu5axZeAaGq+QF8fUQMxYKVd25mY4zJj1
         391Japm0GMyfM3qrx/WWzv8OIx1NOObLBLomOSLk0TxUzoTVSbmQY8niVaJ95z/a3Dny
         TEXg==
X-Forwarded-Encrypted: i=1; AKwUvBxgPvvouvstrw7CtEX+DlFWzjYNLV5TDnYKYZtVB3WPv75JI+jNGG3x58/cz9X3kKc7mE6iLM3T+AwI@vger.kernel.org
X-Gm-Message-State: AFq9FYJjb8CWKPrkFTWU/jzIWZLXe7EV0UKHQbqZgOXRFZ/ZRz7EwUQ3
	GREgRYAlknSwXlkjnvsIa7U0MrWao+SHs7mhWBpCW2kRCpH92t5CQbA+VSNVeZNz79fPXRJDj+w
	SG5feUd+9M1bAv3r+j9Z4FR/81NorAm2TA8/cZq+0e/Dt6HMgbxzlzJPjK4PJ48ZU
X-Gm-Gg: AYBFou3j405yKTodOaVcH3mFQXBCx/ugv3iRUOvHSuTG5G3LO8bKir6vjAjsxpRKrmG
	slyWpJJKJeV042r5XxMeaUPy7GezsA2ZTlV/MV6IfSVzU5dICPu67oBnXSlmIAsUIs4J6ikSatS
	TB0DmW+E/6RVC8+5VMuBx0n0p1pK17lUj5caifChz4XC0SdiTIlziFZDTwGCtMSuY2FqeInM4xs
	FVQpRY1A70B4E/onWx3ExUocrg9thQv3nqfbCvoUcrDEr9VOQXokE6lDZThohSP5b+I2i34Y6co
	AvzsQUcNkeZjYMIV/IzyRi9pobVeejRFN8OKQ5j4X3lj50qTFKZJ8oyslm1E/i6HNnbTGxRL2E6
	gK/zwJ1S0sCWx9468xXnLKg==
X-Received: by 2002:a05:622a:13cf:b0:534:f411:a5ab with SMTP id d75a77b69052e-5359fba6f4bmr420749331cf.4.1792140344216;
        Fri, 16 Oct 2026 01:45:44 -0700 (PDT)
X-Received: by 2002:a05:622a:13cf:b0:534:f411:a5ab with SMTP id d75a77b69052e-5359fba6f4bmr420749011cf.4.1792140343686;
        Fri, 16 Oct 2026 01:45:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eacbc5sm50742866b.68.2026.10.16.01.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:45:42 -0700 (PDT)
Message-ID: <380b8aaf-33d2-4c9f-a746-10f080711f22@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:45:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8350: Add the EPSS L3 provider
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
 <20261016-sm8350-cpu-bw-v1-1-044ac6dc9565@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-sm8350-cpu-bw-v1-1-044ac6dc9565@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: skReEXwoJk1Qe6NqS0_0dC58EBEtIzdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX7eVgXyUgSgwP
 BqC6zdrdmPco25jo2geLCfU1hdMpPR1O8/ijZ2jPpSJux/Q0fF6jfRVi1wpZ/Ylx++iyeI9OtUa
 H47/9GWGPo3JDB3nEylv0lCbplRRZkeh9ZfabEGYG4I119YU7rOm5/t1biDMMlj3HUdneWSPWMw
 mYBd19iE6Z5FXs71B/xP1yMXONAIPO0oAif6ZvFqyw2stj6I2qDChJFP9pCrysGxlr4fKH7+x2V
 wQSIvE9PWoj41aJPypxNUCNxlTlF6e/jGo8R8Ahu8eKXUcPyC/fwv9uKyhXd3LZ0PXmy3KI5Clk
 Zmgtl8YAO7q0yOs7B/oABeTJgzCShVGqrBmBwtaWwYSbDQ9KSWMA/UiUipt+XTSAb3jZ+1XS2Rz
 bFt3pgRXpqUswRAvFAH6h9563BC/DV5cZrGeVvhZD5kUQm4RIYCmZTRgRZXWDAsGgq/Pnt1JRja
 WAo1xJydeXQCtoqoSLw==
X-Proofpoint-GUID: skReEXwoJk1Qe6NqS0_0dC58EBEtIzdS
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e438 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=rBtVOrUcsPcThs3KVNEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX/sTidoh/kbp0
 54a8v9xGsLijcHWw0eKiFnG5Ykhdj+uXpCdtVd6ceJzhQdHs80LyXC62CupdsEFR733NiXVFPby
 ONjLI4ss7tA5lI0F1WAk2+JPwCdQcqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160034

On 10/16/26 8:01 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Add the EPSS L3 block, already documented as qcom,sm8350-epss-l3, so
> that the CPUs can vote for the L3 frequency.
> 
> Unlike on SM8250, the L3 is voted through the L3_VOTE register, as the
> downstream driver for this SoC does. The generic qcom,epss-l3 fallback
> selects that, so no driver change is needed.

This pargraph is mildly useful in the context of this commit

anywho

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
