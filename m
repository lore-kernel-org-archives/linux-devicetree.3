Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764122;
	b=WfMJ38y07+FHHK27OaHkSSDV0wKAMi0qkHbAfEwya7E5f5Imm7VPvebX7053LL5KCtMf
	 iVOKVuSovjZW82eSd0Nt/PARVP3kGR+Kj9gs6sYSxQkF9pWjPSjYt8agyC92geqK0B6XU
	 vuomhZwGt233eD2BWIPsg31KuHR29yek3sz44bKz3DKnynz+ZjwwV/F6Q1AzZuoStvxag
	 kLp5BnChpS5aq8EF6G+bda1RMGmXlo/wmpRVmhngoRqcBNEIkZbT33aSpEFtkRleqxpOY
	 9St0j1f/q+3n9RzqcdlEhrulsk8q+EBJ2Y2qdG0aqH0QQFnTtoqsoOJJ4I1XYFzIq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
	b=yaKAe1EfpM3is/b27jBaD2RwcfOSuDw9dimsMThPkOdRK+Ec6ahH8vanhfjHXq6o/ORg
	 lJBsaSUTamG6BJEw0Lo/CsG4BP69RRHerxvT2w7vR+jTCQgND7aE4jLfyHKuW+lSUpUpr
	 pNEpG0rSZ/SEd2vaPmG4PA+YT9pATYTavsk7Rwiig4cM4WXlYDWBYzXInFqn/b65qsBCW
	 LPacAyfRzliFKcxCNCn9fS+sHALwxSib5lb4gMHCqaBBpinRXqr80CrY9GcET6IjQK+/Z
	 8ZZEf/QbkqqLV5JuXDxgUVeN2fgMAR7bgIROl3PMwSVD3v3PjJglIXjHQ1eXOa+np2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhLjwkIF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE157606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE157606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhLjwkIF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAB0dT1444125
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=; b=V6nvKYPhgn3BRCsH
	D+C4GKviWCHFhHRvrWqZbfTSyoaccLWj0wcjxpS6eOQ12bl7O0A5goNu3khwVj+U
	lYgBlX2I2XYnRSiUAtxrh7qB35vyAKAtWAiX0BZHJMzb7fe1kCZWzzPLRJt+XQhN
	4v8CZjjjHh1R3AsC1hhI+YzGrYDtZFuUToIRyZqSpiL/6xonmm1c7K828ozce/Nc
	w1fTshVF/33gH1E9kjj6AIymOINqWv/9syM/Ss0Wy3kkH3KxYtdj0w0AKLQ0MR1N
	sHj1IVLK4RbYwa/IJrl7YkqZdaWLci4hNqJ6S35glWV2op8uiaFoI5pdVa7sq0SW
	yqEMDQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbm183-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:02:00 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48ade85cef5so250368b6e.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764120; x=1793368920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=fhLjwkIFx861UZ6dl9umO8DVjLgZwxtS9LtftenNVsb9DkxSEskUKuqy2v4A+/WTps
         2AhQZSDaYXIODhMVc/0YcfQfWOCTHlteIFMstF+KHDeIBqYlKngb3QfvWIrwy7DTEW4M
         youil/+WGNyIO8tX5nJ08OmLedC0e6JMmjdDxDa1jNDVyDfCx5QECgdFaoZBijAkDBSq
         scdTARabAl69AqCQ4FXFEwieZKV2NdNM8mt//OdsUM6KRbgBTuHw0WR1GbZum73G+DGe
         MDQ5Pgbnms2AHuIcY0Tyzv/FdLM4m8Yhw55af7uSv0lrxd0qpW653KSzqkzMwyFaxS+3
         Dokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764120; x=1793368920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=GadPKq5cmZstsS8hNjmjxHJU/ePvqo9mMCtOz1yN6CJGMKYqmYEjp79o2ff/XBoYNN
         F6mg5DyDOIlT4SQe0TaeABfLK5tj9tKRw3CecsVrchagSte/pZHaMlgjgg75gls4JpRh
         3MLrVhIknUZFga/ttUPuXJ8BwYLiqiMlWlHMBU9CNzO589tzhLRDy2iU2+yA25o0VvtE
         4ZlnV5DJqYNd0Od6cAJXsWFj6aJ2r/KrT+FlVtAZmTHMA2sUUtAkOJNv8Lnn1nyHDzPe
         DA80yojYVTj8P9BOZFb6H+l/wLXJxvi99ljjJa77OutXzD5pnLjRZ+0ZitGW6Rz9Lwj6
         72RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgmbfCV0fxx+rpT/+j7cunLsCPzckRTKQTTRBwI2393l6P3DPIaTNLpDwPZ/vYmK2EDCJrxWUVxVw3@vger.kernel.org
X-Gm-Message-State: AFq9FYJvBjpNylWbZaK1jf9hdX57Eata9jzDlCXJETygjnjAQvMev+vj
	eyzU4OBr8o5KQdTSR4yAIAMyiOkybt2y8Iu9LauCM343jmxO6LHInw4oRQJ37qrVBFZ19H0ZmDU
	f4yG/3pY3gMm12aCyxcPH3MGbzJfpIyJ4xHeBPWhoald2LNggjT94ff59nkwIXh/z
X-Gm-Gg: AYBFou304v7E6QZAXYHs6DzvVCjLQXHfDsLvF1JFAyHU7y11r2luCkAiRiMuzhQi67C
	3CAbL4u+tMxC0we72yIe0gAaGRAvRu8zLzKGQUoptAHvr8wIDVJbXAq4IK3wLMcz8saGmzN7/4i
	oQ/VgPHjFfgB7EnsTEtE/aGzj2vyODHFWyW7LyZ5dHX/pIHMCx/b/ZjOE73UgS8PpbPP3kWBFmy
	dgJZtovx/TGjH+9XHRtTA+C3jhVBp+11y9ETk1md4Zj4bCm2x29H8gsuH8SdWnVLKzzbr220dLH
	E29XhwQvTiTKZ+fyIpoEY2GuAeav4GtJ1GD9eL9ggFKyv555CFWL4huldSSEuHBxk7bjJrwQ1HT
	MJQZU8XPH+2ilQjYr3J17XA==
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793502b6e.4.1792764119666;
        Fri, 23 Oct 2026 07:01:59 -0700 (PDT)
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793350b6e.4.1792764118501;
        Fri, 23 Oct 2026 07:01:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8da9019sm3783766b.78.2026.10.23.07.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:01:57 -0700 (PDT)
Message-ID: <071fef59-9131-42b8-941f-d7fbf5f57ba1@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:01:54 +0200
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
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: ipq5018: enable the PRNG by
 default
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXz37PYbCur6pj
 f9EXgdv2PtHXhs4EO5EI93635GKooY8cURwIKRMRkciyhwCIxIlQUgqbUmZOh6ZIRhm1E2qLQho
 f476gGbGTK06yRk7EGc1UzmOhO2Pljo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXwxQlszEK3vPl
 ISg6iiBHgtGyZrvIVhHZobM7au7ZYNVbJvJ6I795xKW1VgANlvooI3c/VE2napXiqPDjg1JanvH
 7DFktA3NWnExIzbUllkeoAwzzAB13R/d04uUjL8ZSMuAISqDLxJZP4APl3qR/Cwx0QyLbAxu1kw
 DjNu5DFQ1Q1FKoNwWGdILlkx/ntFIBH9Y+hAwLL/ibGtDmbENsrrOkHBMHdm9Q7uMN9aKvNs/Wu
 xqY2p3+8r9gcohGut9MFv4YjQ80RgAiSC4KgqnWtcppQQalui/nL+MlAv/tbK1hCn2vvZVi/k7h
 wg18/iAqD14EOMxcm73IYzSTnZEacun2AtrfAZQtv5HdH4SkJmDqWyOrO3UzM++PddDddJyu1rY
 j+Ht/IHwPy2/PPsaMugUVJ+V7jejJFspHH003+53qzGejLIyi1yg7YtxvdTRinfXwu6IxD9dgQU
 oBYdzeRjyCQfEWg38bw==
X-Proofpoint-ORIG-GUID: ClDyvoVLdmcpT9MLjsHKDk02WmTMWvxa
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb68d8 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=pjGKqCRHFsEXOSBd6YcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-GUID: ClDyvoVLdmcpT9MLjsHKDk02WmTMWvxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:36 PM, Andrei-Alexandru Bleortu wrote:
> The PRNG needs nothing from the board: its only resource is a GCC clock,
> and no IPQ5018 board has a reason to switch it off. Enable it in the SoC
> dtsi, as ipq5332 and ipq9574 do, rather than in every board file.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
