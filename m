Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96F293B75
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160542; cv=none; b=VxEa3BYRhugC7ATwzxQG2SW+wuDFkwKMubxYC74bTDxyCsRLhrfb4pQEhKLD8QzxFhwUd4ryP+3KLAkiI9UX6t9nYpPLcG8Uoo6eVa3tJ63ggv1HiPS91ISOtam5kqnK2zSxCrXFM++N2R8fSFftr+oULxgHF7SKO0PyrwLuxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160542; c=relaxed/simple;
	bh=kORCVDsWGCpDhkisR/azDk7+qHAvKoqMy3xtWWCCDvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LA3NOk7EJ3wNCQVVDfjmMOcpd/ksEcXg5IQXP1uJ5slg2GQ20Rgohr0YIl4i/YNIAJ0Qn0CMU07aBEdThl8TGfaYGEQYr7Fv6gLFx4U+WTDUT+BzkLI4/H7I5PXrWXC404KEVcam+qisD3cjAMCkBCpAgKu8b4NL9hyT6PNEQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+UjZ9aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADUnEgWR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+UjZ9aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADUnEgWR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52I8D1933541
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxoTtQGpt2NRnraiRP6sl7g4799xTHOIwvY14N1jedE=; b=Z+UjZ9aMLgVpb88y
	7eOvdVvnbpZkSRiNHi5Jc8RVgn1FWsqg5rXxf/VqZwxLwf7wv6/blaJRnrtOYtGg
	8ZHYKP0wJJG6+1lArxYTCbJ3pZL1Q7s1Nm2ydc3+mxbUL51qFx0Gvt7+WY7rpUze
	ZA2J/bdLbR/vvTZNkg8xtrWzNgr7eVEvUYjk3LeZ+73c7pDiJ2UfQlrqqqH63BBS
	OfZe35uT1xXChmgdTl4MMOtMsrZ6N8/sXVG7+mUXZxwt0AcR2uun9OfPxXg/9fbZ
	Ac7tqSzRfKhrJEIfhq2mjddu373CZeDHo1DX9lQGGPXVRbZQ9LDz0uen5B2fdt03
	TO2j3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq84xyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:15:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fa40fed05so6306631cf.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160539; x=1788765339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxoTtQGpt2NRnraiRP6sl7g4799xTHOIwvY14N1jedE=;
        b=ADUnEgWR9mTodMzt/N2fR/MA0aYj4jpVYBNANc0tSuCxL3i+64T3XVtbAQ+Zuu0suc
         hFn66eSTNireXz6O1pUFDMJqC9LqK7vRtvVloS5kA5oDny1ycXkC2sQj5dbTxItf/1kq
         4RX49thf0tog4Rby5ElB0H9Afm7VuCHqInwH3WG5xmKY1q+VqBNJ6EsNZhkfHVKXiJnL
         fZTpInOhpwpheS7IcuGYLZGHwbeb+OD29Dt96AarOEiZngVR2sCuGw/3ZsoXxOG01K4E
         iIOOvFMtkQtBZ+QUCgfK+VmEQurbfQhFdUXVjFmrdhXR6iiDkFw07ufzzIs1KuocZNwJ
         YZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160539; x=1788765339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxoTtQGpt2NRnraiRP6sl7g4799xTHOIwvY14N1jedE=;
        b=EoYpp97XNdSZdiSoWAzO/fTWQeADNxEfdg+iTguAld6RqxlFka8mOczI+TxFnVDyKk
         Pc3pBxtjbtdBij+O+eQ7G2wyd3KN0y3hn26wfo+7LhflZAdg6a5IIHtUgsIFxgXKU81U
         hut1SXsmXG3izPnsazpmcNlTrK+3h41DAx4Vi/lRXeOg8E/B+8Orb9WDwe2XQy2nw4EA
         gYDAYbnbN866BW8hQ3TXAShrBM17rfn+1HaS7REPOlC2UiYqmnZb/4IToJTTBjBZEyti
         H4AORvfUjusClvSSkGeIc1AxcHsmV/fIF3HuMe6b+9+HLJfE3lzBDb7gxK9xJd+QIINS
         v+oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5yg72+CQvF0ZjAT8qHUr9p6SnONJMYVlh9M7NAcxkJDIjroM7p2l/4Qo4bjtWqhSYjZQr9TumxhUs@vger.kernel.org
X-Gm-Message-State: AFuF++lQKypud0LaMpACk3Fa/HQX5fOz5J5LT9pkK4V6Kko3ZJRb2G+D
	eI9FegsbobOHimaTvSKVh7wRQtF+ZZ30wTAdNSepiFcPlZCey/zH0IAztYytarY3E//eOKBkRlY
	m/QDla2eTDw/iJpH8X/CTLIpMK4z+OpUydQWdePBnPzei7anugVcK1TwJQhVrFfsj
X-Gm-Gg: AR+sD13eYtjXsjo77JDRVpPeOQuQWvBme/YTw0XwSu+AqGxS6PbwJSJIFDyxBQ2yzDy
	j3HCm6YblpLqvPrjLZXbZV6oiMz5MXTxhKpx2mRdLQJhkt2oR3N71QHgAVGalzbELStc6tWCYl0
	6gpdjste4f6eyF9LUdKsC87334nPRwUAOVdGcNZX79P313YY8DM/VbhZiwtH54DQaRdJ6y/5Fux
	H2H1PU7WH+4kadTdruyoy59rVYEP7DfXxtzdwS2b86WUc8jGR3BL8XZgwQWaJ/OY0N5iUZXB02p
	wa3dJpmOmzUuLXQgf/blTp70/MuV1JhnrzGNfJRCJ2/V1P4u4SBhaS8s15fAZxQCK07SWNtODwU
	7bedDJufuopyXvtpgFUHFGQ==
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr764554085a.6.1788160538918;
        Mon, 31 Aug 2026 00:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr764551585a.6.1788160538530;
        Mon, 31 Aug 2026 00:15:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm408993966b.6.2026.08.31.00.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:15:37 -0700 (PDT)
Message-ID: <1aaacff8-18ad-46bd-a3e0-8df58dc1b6ce@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:15:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Replace spaces indentation with tabs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vfMfeCeNr57dMw94YkEP2aSlBQs2sH3W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfX+5puOb3VolT2
 ZtAOUEtBAsfGNiTmTR+5yBve72yVHwddEbdKgGatIwl9zK18r5SVds1TRijTgAxaK7NUfvj7kd1
 1g7XvEJtwV0FXjf8psIlIq2bshLu1ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfXz8IoV05qW3OS
 dcjfuwA65l+5s+s0jmHTz0J+Krb1EDD+X+gsI+f/g4vCvF35LYahVCZzIO3vWgVcRoGB/qdQCy4
 Vooy/RsRXPGtWJ1sJ0M9UTAF2N6/i9SPBZ7wUbJnSnQ/BNhmsAIf6cuXh3o+f2NMul5Pb+TajHJ
 0bKUP45cdnf/mPKHiZWg/YBhfcefvZxFTH4G4zBIlLjvyjid/6PJGKPT0wZnhNGmNRjrUfPDIys
 ExBoQQmxFe2wMRNrhk5SaxP/5dc/5TYnItUhRDKd/yNzfAFJ1y+OCd4YFfa4nQVv511RF108S/U
 hc6Qk0UFOx0V0FTfDIkyOipqG4dZAmC2F2FFLOdkTpPf3D1y3fF8bsh4gBCNYVnvQqDDDLEbWan
 dhvg/1hxJbLUuZovnQ8cSTrKXdDmrTOIVg+AsL5TxWh4XnJ6vmy63UTz6mHjtGl1rcwGh2LnGQC
 497mil6jo0t+MzA7faw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a952a1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OO0WwtfGA5T6cXiHK_0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vfMfeCeNr57dMw94YkEP2aSlBQs2sH3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310060

On 8/29/26 9:38 PM, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
