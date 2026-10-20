Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498593;
	b=nbbC4RKV+dBqnYRbjkgkzKAAllnEcQoyz4JmU7rVcdq1Zx8e2Sv2gHhyKDHvXA2B2yu8
	 v0egcyzrjFdP5PJ777+rxOnImaJxBis2hiTNm72+Hz1Kst+fG3Iujnxi6xbU7nU6417XZ
	 WsO/jOEsjToYH2OtS10ycHhBg/4VdMoMkkK4leSeLyImpsE9+bAH2dlxmJLLX7liXLLds
	 KJbGQ/eugWVwYS2xzZmwV3uNgrFY7scQDZo6nj3rpcFw6rf7nolT2CqF4KaBMYy+BDkUx
	 /Qg18FA2kp6vQM0qvMR4cxgb21Lt4jEjOaZBAkVGJc9MmAkNOg0R2bcgMDjdzXyxMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
	b=kkVwMZdvFqS4iQvhNLWXWZ0StEmFopypf79SXqRj8ygGm/UukV5YImoBtRRZJYjKfuV/
	 s6Wcr4BwjvDz9WYiKFv2sTZ6QsxzFaoqi7Mwt7U/TlRORvheevGx9VKXIU8UMOyroyb9J
	 cFzTkz9KzhQwmb0EDz1fQ8wJDW5xS/E9tDYqtRXfzCYXpxkPrs3CMqCWnT20ojBPHGyZ1
	 v3x/HTLKHN/i7ZYxEwv3TdhzG+QZ2gENZNEf9PHGMmuMgas2B/Ya00lS7q1idCenO8kY4
	 f1f4ZgGMuv1vzGTYp5wMB58GbiAVHJVMkh61SlkcQdw6FBtZaxXas3lMv51TcFisoEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JID9g8c7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXO2qyA+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189B1606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189B1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JID9g8c7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXO2qyA+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBG6H71486399
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=; b=JID9g8c7iiFlgzX1
	UqmCHetnxCha9hRvNy75UyVveqNRK9Qoh2Ys0EfK4f2YLibkkImOYavuzM3T+PGi
	pU1fUvnEkgSJ8Kavwe6Wh1vcsHJL3sey4cIPpStBMpZ/Kcrf+V7dCncpovHl1Gqk
	SbupoRuTBSic0JRu8civ9BGVLizEl03Vf59gsE49hsmmLInkLiw86wPvZ1JcADdK
	mU0HsACFR7UUvhwoHLduWnukN8aPwoplQlhPQQhsaren7Xs1sYm4zGiUakLZ6nF6
	ZjWqqj9+uEWtQPQQCJdxjL0ssgN0BO2nlciDmv2fjUyDU/0hx7l37WeVTQFxMJ+t
	UGcfuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2dbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:16:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91795e52969so9001676d6.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498591; x=1793103391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
        b=dXO2qyA+54p2+XXONPJkrVKegExcBGR7nB65DcQ8UmBLF6mdTFIfnBW3IH0I3vYtdi
         M3bikgLZTD1NZ+LqokCa5SgJQay5sZj7pJY6XMTXRdFYqTj+SMNmWg5tLfQJ5SDLeh7t
         7d3NRaMoiGTWn0wScwygMkk841D4kjsFG6BgyRYEIvqwBTwEpSvm+Kz258Vd/MclA5Bz
         nLDSlzhq7neEpjmqeaxw0hhfhnqJ519++vVdlB3WKE7vYuAqedxKURnrNtDqmZjMEpUX
         wtePp5DKr3lVmbb5bCkSTR8KQd7EK9JFQpCREGEeNzSiAuMsRVn6Y8YOt+nqYyU8B0lK
         KAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498591; x=1793103391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
        b=SylqjSAJJf6F8ccc5x4krzbv4I5iGlrn4qvoXzqQD3R4+O6Qor2vtSB2Rszu6ln3kz
         Yji8G5C3aRtvZqS7YkMAzpP+IcWthLaFB2/8/n9/BhZitgGjEkYUjDIH+oXllQrXvMsz
         Xpo9ZNmCJ+T0Bwt5Wpywx6QyIUpUhOJbXmBqd2POYZuoD3zgI9I16URRC72K5xPATGFv
         XDhv5avuyG37ZbYVHxIYqNgGyEs7Iu3oCWt8WrYttzmu2GLR5HbLFqYxG1a1nj4QCAJK
         6Wwkh/VaUCRZ1UqClYj5vZmC8xmhZyJBxsDS+Kv6xnIMfAh3fsRbIlCN9Zapz/qQGtHu
         ZyOw==
X-Forwarded-Encrypted: i=1; AKwUvByykSe8z81WeiqEJLVfCSbfy6ltQCPWEKKUX+69t7P+8dOyfJsDsXMqfsKbV67Gv7DmjeB4QQVvZFx8@vger.kernel.org
X-Gm-Message-State: AFq9FYL9Jnw0NVpkt1CTeraSrDIcNslxVbM0AocMJaYACIgUbttbBTgD
	JXecnpcqJdbUR7QiU+CnJV64OaT5s+MGMFuOCQxPwRjqQu286gkkN+7kn7N8Wt01mYzNZxdm/RS
	1rYoTiC0QNC+67Oc3M9n81YFglZTtA5UAJqOEiQYF2aqJQBwhsm94805MH2BQcoOB
X-Gm-Gg: AYBFou1BdEaHjtmqmjcbWIi04xa1jWDJmUU3z0VZ1gpK6DUgJd1XB6UZ9ItluC916eC
	m+jQ826t/bfbhtryKElZ5rQVzRJux12RwZ1j1jzTVYIaBzgyLeotpbgvUPaAJbP6yPrn9wUUqt7
	+WPjBqS7fKHKRaEu5SlaxKsRR69qn515f4HlxI4l/gsRVnlnk7IZSqOniMfiylZNdCrlBcwqPHS
	kp3EeQUiuIo7298cvpcq8rna7203F3DX6UKSQ0QtuELX9FSpivCz0saPXeQKQ3M4y9v5LsBqpq5
	g0R85lyxdM64ySQazeNhM9WQz5SvFyKgjqaqg2W+IRNHjA56+ml08xROxGPTn/LWa+LcNiA6r9D
	K3SJgAaxdb2bDvhiVcxy31Q==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr189331771cf.2.1792498591287;
        Tue, 20 Oct 2026 05:16:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr189331401cf.2.1792498590868;
        Tue, 20 Oct 2026 05:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm477131966b.17.2026.10.20.05.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:16:30 -0700 (PDT)
Message-ID: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:16:27 +0200
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gf6Ru3tcREydiQfUrs7Q13rzHexaJsvG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX1Y28TUp4p5rf
 e9U8DcOB7CmM7zDPZYLKUAuo/R1Po3GPklkEQ9w3AvKTPbG3UObbZVD0bC7eJtYXWGBHaigpeN6
 nbf0UVtx0M7MYD6InIsvszHaifXDyOw=
X-Proofpoint-ORIG-GUID: Gf6Ru3tcREydiQfUrs7Q13rzHexaJsvG
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad75ba0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=u5ebKnrMhyFaJCspccgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9B/hJSn2xpdE
 IXk6QnsiRsBvsL602bvLlNYJc0NLx5X3/hnhNxuWZtX1bH1NTOe6BxjCUz9c44GRZ1SdyxDg05y
 PMQnwmeAq4qMQpvDyGrGLDctTcrc6k/kdedROoBI+C20lbfJgYVHI6yYBl5PiHnhU36F8exOe06
 okZDE446TOXAHF2nwD+6ZIdRbsnzfJGRTWYTwFoSD5kSWsdv6kSZQdK1C1Z6XiKTCT5R+xlpi57
 ENjMBW+U3+2l4J75AE94lcIMIdHQjnH+Fxo5ZjJSYIxJbjhoseoD9jKK70WY9M6uyaN0eCbqQnR
 Avw8+cvtVqBQr74LdW76CmfdZxl83IlA3SI0U/SEi6/VtZEKR4HPlCqfXCdqwefMEDEd7JzUAkc
 hbpPY6y3kI6LBeEKITtUTrpB+M8szK4wwkooaS05yBJeA09GhSc7i7ooByg3sLgjb+urhyajYJf
 izxyUVC/gURVLLlEkMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Add initial device tree support for the Lemans SA8255P Ride board. Enable
> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> zones for PMM8654AU sensors, and SCMI protocol nodes.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	thermal-zones {
> +		pmm8654au_0_thermal: pm8255-0-thermal {
> +			polling-delay-passive = <100>;

Do we need the polling, is there no interrupt?

[...]


> +&pcie0_ep {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> +		    &pcie0_ep_wake_default>;
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;

This GPIO reference feels like a layering violation - the previous
commit promised TLMM is abstracted away

Konrad
