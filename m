Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471539;
	b=Qi99S/oodxPhq0O5UAwP++zRoV0RO/BgP9bYb1Uod/Gqm7S4Okhg+3/dAP1pavqk0WiA
	 BCJoukHRWQ8U0ra36xzQg9aopVb/sedCkWyqR4Kfc9Y+xzqb/ZkiC6JyxfkZfFveQjVC1
	 +ip50j2IP4I3vwYv2JAKfK620zR8hEzAs7S32LRj5FYRz5s9JwOOxJyXgqJ5M5vgT4iUm
	 EF2JYmlnDHA2097VjCCMxt0d78RP9sDMzxoAeBrHb0+dWkgsimZ9+pMcuvQvzTMiiOGg7
	 bDrjdP0AUqOn9wV3QGer/6GHHsxLpWJ1TJv1CAy/C1FBiQZC7D4zVHGGrFWLFR+g8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
	b=lQsh2MApt6ftVEkJpzvI+XLFI6RCYqY3lBjAsp3JqUFtYuDkSrBPRskInPZSedSnw0Cj
	 lOcgiWkVFtcVe1KHC8jqCbzWqoBdGO1S/cSmEv43WT+hEZWHQcfqK0YAhiWBHx944/YY3
	 i5xM/lgazVTndoI0MfF5LHk6fL4HU0D/uBr4XNK6/D1pcJluDnwSj8J8pK5GsgNcF7nNt
	 xaZl9RJ9I0gLJFUaLTJxF9gbe5AoqUvSOf2XUaa3gSZoVPN1b5InddJkTlXp2iLkEox1Y
	 wHhaEFD39PGC+7bYEXNL4cXWEz5I+Glq2t7YkYYZL5ZJxMqBz3oKDFENFxpZeWWBbPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oMYk/6eC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36361606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36361606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMYk/6eC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANLCTj0189099
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=; b=oMYk/6eCMHBpz52z
	pxjsUACx/yjdyR5Na3Y8lgC9d6C3rzIA3YPT+aq9bMLsCAaO2xsqUrCU72fK2Rpq
	ravGaf4kufhebKk+JywQbnhuzTodAk2WlM7uU0zo+pMG8nwpgONl/GZ936HeTWLD
	FXrxffHXbElvhoolh3X96ZOBorOZZNKD/vRx4eNmebmgR1MacomARN4CBT54ifi/
	7arjReUqUf+Jj9lQrS162Y/uq1Z9rbOrx13yEww+aNIguPai4M5UZ3WEdPLR6H1k
	upjPHIW0VuVeysy7hevmkjzZe51l4g8uvrtc/O9Qqt6yZJY6OP09JE2mBEVPnlbe
	zMAaIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sr5gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso530875485a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471537; x=1796076337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=FfIHwB8eC45XW3nJK8rlR2hRjhfNi14xddoPI6f/Mdmcgp4CZ3zxepPn2/dEwquhUV
         plXJ9BTg4OjMDdNRAMGnTT3mqt+8cYblwgRVX/973o+8PlbPLgsWUwKS1TZUxMw8n2eD
         cNIKUTjNbzFgbfJpXhhahSSuW1P37Oguce0ZQoQp70RZQyG34kp7yjE8VErTLSho4diW
         rq9uenBaFSyL577DNgOCHdsBtyxKsTUeUdgLzYB88gh142IgCdM3LaM6NH0sAa7zIhFs
         gav1q4OxCvOeixqEX/YBmyNe3R4Tw28reWulRy61IDjZ2rvwpB+FQGPqizqUyVt8Gkoq
         L6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471537; x=1796076337;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=i1nzuqyysl8oE9kMv5ttd0iFcXpAmxw+6p32dN10p7g5JSMJk5LHreH7awiVJoprQR
         K/D+cZtpmQlgK77ZcLm4NTGm/w8Jbm5zOhcw1dAGLaXkmLjTP1MtqJ9owXj/vx7ZcNbR
         y0uhmsvCG/S6m3TJUQnQvF2wZt95MAgk0sx3Xi5lAnhfiUdEV2cdB5lAalO2CD69/NGm
         ELY/anzE5jN+K66XI40y/ImX6fBSX3mOTCwZFx5mGicw+Hnxj9xxas8+Gn2SnQiatj/6
         fYA8UdTc3BmN6H0l0l1OXCBi9JFrlMef/SYwTQ/SewGzK/cG6SSPg7LpvGGbS2Rk47m7
         ItUQ==
X-Forwarded-Encrypted: i=1; AL+hErFjJlPU0UYGYx7f8V5HBhTqd/WIGSfkF+a5ZqufFOzMG4528ADfNNoJVQFKRcbfCZ+/Rw3HPfiPq9k8@vger.kernel.org
X-Gm-Message-State: APuU4Z9KBPLclh2fHdd1d+aUXAu+PqNdoWwA1++OM+OS5GdVBbCZryWm
	f+enfTWvRJpwNg3tjMWatYyZ8W0vNJfoSYQ4oYEldWtQKWxkgfQuxmaVZE5E2d+FEhNB3QJ1yZq
	byE6Gs/il42qTuxaMK+GyqXt8Dkzlzh8dRHuVjlMWqkBhylhaVm3pIvQHbSZ8GMuQ
X-Gm-Gg: AZFdTZeZ5oJDQ37aF0uIfMMp8FbouVSalnilps5DW/snSKiMRjvfWQK4afgQjbB2pcO
	aC3R/C7s6KzzXq69tNEXJI+Btgm+cU6yHmqQnOVWhvoDJv3Pm4fxQuZeJRj1hLPwCbP5Ape1pD+
	qJh/0Qcz3O/iAZaqA/TqRbaouYK5xPpeFNz1Ql2A12eYOu/fzGTUje2vG0xHo13CDC3M1aLc4Yp
	+4QTWEqtVC2TXNnJYwv8z/KwTBKaYbp6gaOUjBP7ukCiTnH2dbZ/wlRydy7lCye5NbCJrUL4uyW
	IaXfmsGADYpdajZ8Cw/K6l9RqcwPeORR9u1gGKbun/xAs8TWcamPvuI6rvbEyBoNQp1Y0jRXGlI
	batpOuwTIQ9hovc4V07963GhhH8JJyX0HfO7mr/55gLUt3OcMWrj+UbSpsh7oIStRAoAsD/cKjh
	8=
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138287785a.59.1795471537358;
        Mon, 23 Nov 2026 14:05:37 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138282885a.59.1795471536895;
        Mon, 23 Nov 2026 14:05:36 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm708892455e9.4.2026.11.23.14.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:05:35 -0800 (PST)
Message-ID: <b1c75c62-1b44-4ab4-8bc5-688762bcb8f9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:05:33 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nm3Jsg0oVtNxk7abx7SjbcvzkjmP2tH7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX3B7v7GfLeGYf
 m+a36u9S5GQX7EcdMA9WMjCn1yQmYduLLUcpgcYCaJ9TMzuzLCcyfLMG8sJnOfT9BIMEAK3G5hV
 mNLy7EwXRJWx8r00rFNzMg8I23iMxjk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX2oM19OXOiRSr
 xJXSE3xFhJhCVvU4OIOfOeRtIcY43EcYLvBgj4RdJ4SKMSLkv/7tQ9Pvq/rvpS9gH8uFMReRkpP
 DKitYPPdbdQoqkL+gGm2uYhkmuPW5U21oOoeKgZr/iuDvbhdpRBgmOUL1xn5+LZyJxTfmRgXunv
 jUlJNzxSQJY1aJreYMbGQrNqXL5SdFCwPOr6fqSB3SOF1UpqtU2itkHzuvIyX92QqnxVSjjfGxj
 TpbCz8o59bCTyo1uYdWQzXuKjbjCh7IKchsFt2FFwZfcoWxYJ4d6Nr87Gk80cgmxxt9YbjmwLfn
 nzLj7dOSVmalfGoDIfUZ3ITtsPX3xwSgEQfhL63pizeQDpSJsXnd7wO+px6uB7A1b85BYrs1Aek
 bFYNrfvyf0+ucvAioOZB+ngLHD0V62GV2RwI6/mRvp7N0g0sOeJqvludSMFcz/QiP48LXLyzbSc
 kcgiP6lLO3KbYdNgZLA==
X-Proofpoint-ORIG-GUID: Nm3Jsg0oVtNxk7abx7SjbcvzkjmP2tH7
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b04b8b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c-T1lRSgfK_BPOqrbiAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230087

On 23/11/2026 14:34, Shawn Guo wrote:
> On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
> 
> Same typo as in patch 1.
> 
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
> 
> Nit: Drivers have local copies ...
> 

Thanks

Best regards,
Krzysztof
