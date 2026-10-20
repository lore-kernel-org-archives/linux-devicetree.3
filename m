Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497112;
	b=rr4U0MS8ILTj0s3Azbzciy9l8v3Dn0Avev/N5tCh1Zlu+z1CqbiEnTHcbFc0CgV6OQNt
	 niCtIY6eUbhFwClnrDhJBpbQ7LfCWmbAT0uoMonGoSmKO5PnH5e7txd8xON78Wjko17S7
	 Sb2DSQBaPUIRqAkFvJXZq35qddq3/zTDafHHTfgbbm6kp6QGkyfVZCfNpOFvFTGnNfJ+M
	 KDYpnXuwZu3YF8Tnf3fWvNkCiP/z2ha+GKsCeQ3Wit0sEjs6p8L5MuCCG6vT8Qk+IxVEx
	 xArqajZdAcRPhsPA9dHJGqCQlI8kuGTN7KRRqkRry8iIonxtQC4mEQBQSmY3cj/nMhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
	b=b3ZSDFvfXcZx/73ZbDI4zDQ/DAQ1KR/tOijdMm8ewq4GYSSK5Jsi1VKd1HMlv7W1Cc++
	 ApLysF90TWcsL6RDmxyjcBdLKG0ZUpmvp65absFPQCkPHC28lVL9F3YSo11N9FurQuBJs
	 EVqrC7LaQbIsshCxDBZIehOx8rNlV2bN+6m4uoYN4l8nsFhGaGE89WX2dG6XgoBRtmQRX
	 ITWyS+Z9Wbi9YKFcUdwuD2iE2O2XQF/csV3f9LD/RRUeWMdG2/w8ASxyUb5DFZgwGHggZ
	 Rwq5er0QqoIrRbTOwBTd/sYLBVl/AvWfetGb8S5G9Iw16G81yPAejxSF1cOZ8+wJGTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXBI4RDV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1CfymQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9134F606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9134F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXBI4RDV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1CfymQj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxlVN2564126
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=; b=OXBI4RDVrMIHXvsv
	UER2PYbOqCXNRRkkNoJEkFVWQp/oA+UcFK0H4qVFv22FG7ECbZKiJGWibfdRUh8f
	vh0v6TBM8sic6kqWNiWTtJ3mp6SSEb8a/jTKwc+uuZHeET/y7sFSFJ3FCfzNMJJ/
	wjyGdtsUCDmmO2Qp+070aCX52rWdPa9S0K9nVBo0xHZhzHUyJDGC1V0WyO08W2gq
	VXAwKR4pY5G05lporJzV5KHVAA/imLqO4V88he+vdzByvnXVHZiIHY/1f7Yl69F5
	CzM5RTCv+Rg/G2v49UZgQtECaewTgLv9t6M3y+7UTeW2PbfICFEDXZlD+AO0tykS
	FydWHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5naa15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:51:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so53618285a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497110; x=1793101910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
        b=j1CfymQjJMTU2zsjSk2+ozhq9e16+313e5JQHYpV1iEfMMW0FMeB+ItuexTIxkYuiF
         thwwBlnIsF5Pf0ZDvDZ3H8m5feW+lg0xiu8ZQRTrCL3xkT6Rdh0VCBa+xCZV65PALDVz
         bqTJ5XJb+s0i3ELmGE+FHRILBDa3h8AeRi6+8eaKEMZwOoxHb4xyxLf5nybnXn5pJEWR
         afX2akrNtTesYUjmOX0Obf9DXl1jpxR21V0CB9evWLt5qMsSalj+7qMOnWmonYfoAAYj
         h+lEuCOnS1Bnuqc138KUjDq9dP8sGueUmfj4W1/tSt0rHECg8vVpdUnRj3TWoMhWlv5c
         Jpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497110; x=1793101910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
        b=Q8uX5qXVI1VmWj3i+NhGV9cjxjXMNul2ADaY97hAYTZblpeG4xdIB/2jT4ZWtFqnOE
         PEhqruJHT/V+IHL1ZL5jawpYUbBk3Vf6dnFAnrRIVnhjiHcRyd/yOTQW2PqW0Yg4PIKS
         QvV3Vg9lxkTxWWvwD3EBSW20uaJEfl8kLMCa/p0VeWMEhbE333q8UbyR9X89Z58+zL8g
         aTpyyBXGDL42hSLduLqdWbNYum4fyyuBws3d+f7vO27Be9lpmzh90xGzKirvSMOlZSGh
         JQOL12ixTFaAlJ0ZU/MinuDEw7y7x0pBgLGxp32NasozxmcZVKBBi0uypJ28UxsifW21
         vLMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMhpV5oUQ16etxxRtpTMwk3qWzFvLkzr8vUMzCSgYeqngCfwRRCjb8AtE/3+njT1MZaK+viov7ammc@vger.kernel.org
X-Gm-Message-State: AFq9FYK7I+gjOlZEOQiJpXx1Qn+qRK6nDFQv84tC5wpa/JmaAJIlr8wU
	FRSoYzicUxxYw6bCJoNlF+lx2frZIiV7fdBG9po3eesWYqeTuwSX7mTMfl6SwEFD4tmpT5HTP4B
	xbgijjDh+mKhPocPxHiXGgxDvye8eH0SFgJMCg4IIPqt+8iyo7CycR8eR2WDqYg7X
X-Gm-Gg: AYBFou3UQK2SNlC//g9Bgbe3bpS51Zy6NomVWt2X6v/PKL6fSiQIsK1foe3jWmD3gbh
	ERjrOA9Lbwfd1l7rDj3lgcRulQw33QERnuhRuwxclkL1rvUj3hG5d7fM/+Vv0mjzlDdNZPqMmUt
	G/JcgCHGgVUnvpwLKsrdxJDZ6/rbGCzp5DSwtyFT9q5qYJxq/bEUPuNuOjx2iBu+EipH/JRKeZv
	GmI4ne6RZfKMO+dzB0Df6HOUebqL6+PIlkv5OF0KoyGdgXv/QMyxTIE8OoJV8zg2I8sIpvEt2p2
	NjA/zcf28IwzMn9UlaIzuo1ZXKX+KHCRKoAwv9CSUCXy6ZHKFLefZTYGx5BE/Osb3ABc6EZddVx
	A+NwlD/RXMiPMblfIyMFEog==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1863473685a.0.1792497109887;
        Tue, 20 Oct 2026 04:51:49 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1863468685a.0.1792497109274;
        Tue, 20 Oct 2026 04:51:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm5439285a12.31.2026.10.20.04.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:51:47 -0700 (PDT)
Message-ID: <0ae678fe-716a-4d1b-9809-f106f9fe6199@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:51:43 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aHHmFEaDftxSh2TbpQkGRDl1I11hBki1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXxZ4uxIyq3iLe
 jGzUdE6SRBcXcYRs/Gah1mlMVzn5mc0i09t2fUA7Cb+0PVQP38/ApUpelHv27wgCCUgvwJK5wmK
 RPZtRzReSPafxZdkDNDEmtxtE4imxBXjrs3sJzzaTMe21pyYPM+EC1aqud/GMnfbRtVhejxdjKK
 pfzQcWaBo2LXpgq0n8sd3qOFQTC81b/NPNLu2CGp2QrOEAAjKcGe7VBHVb0FUXJ39q5DWKI0fpL
 zIyRu5eSkLjOgBZvYyML95JawYQLUzm1ypCbMWeDAaxlzxocUADadbchvSo/siQKuR69pSW0+jD
 0KAmD3+EVFaHWzS//iCljQwHAXlytTlHbEwCScbisT6QC4jKGWAtLurJuTKX6ftjAPTx8sQMrGt
 HqxJJslKenSDigtYXRiPtkCdsZf2aJBkAfHZBXlvQityod+tyuKXkTh6hEsoXVSgYgSJiVfRU0P
 xY3CXQesZtWyXDDm9rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXyIiyure0QIIB
 8ufWtJKb9baE5l8aoQ1UNHrdqAUZV7/lC7jx82ht5asIJpCF53wDDGCDSaxl45ibNs46A1giwGA
 fw5J6RUSwaZLdlZ3zlnkpQx9HWBZ9GE=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad755d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=X5NsFxh-qW33anU7_OQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aHHmFEaDftxSh2TbpQkGRDl1I11hBki1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/1/26 3:49 PM, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad> 
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20260924-shikra-gpio-expander-25ff4a29c848
> 
> Best regards,
