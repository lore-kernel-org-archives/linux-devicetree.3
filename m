Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3933C48125C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401033; cv=none; b=ZmXu7cf26e80N73cBOHfh2E4KhgVIChbdwD1E9oQpSJ66WA5fauST0k6Aqkb+QhOlegOiE7n3GiWmkA0Fp5McCZp9WdbZqwPYQTgWssz45321CdZUthl2jb7CcE/ToEQr3JyS3HlLYyMtAjnN69A5lf0aL5K+6OoS/fXqgTMlCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401033; c=relaxed/simple;
	bh=k451+gMOysD3Eraruqh9nJz/poTGrMEDToEArn6yRI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhTeVGZKapJ58XkE3LN+BUfz3zbCRWMB0zdGN/h6iukd+DxWovw+9FlZM2MHm6XG2HUDo+VJxRluyU4jM53MqOq3oftPpxoEpfbN1W5Zq0zqPgYzLtwXR/b6XR2V+CD1Q12ImtoCnFVvouxzTx3xxQO12D7eOmXxYq8+S85W2Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2NdKtfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAzpEreX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2NdKtfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAzpEreX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0SlB674451
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjWmSI9LLOuF7sYbpE+FB6ICXzIryi3249bljTKVuPY=; b=f2NdKtfOUYGVlnBz
	sKa5mCo4BlYuw5G9NPaKCRUph6mcjLxlgTV/yUZ63Zgjtse65IARtI1F/svI66CL
	/ghW6/jH4lFsw48ok1ZU9vHkqRKz0iujyibu9wfQI0s/E+04+1g0Jtw8wpb4ESYg
	qZM+AWEVG/qXdkrQ3n6YcLND9CgTiyCKK7LfyvudS9Ts5uFdj/wbWkG2kiedNwNM
	Z+rr9MaORAdx+i+X9v6bwaiAYk9q0zslcRum3IxbvFjcuOmJebg3QDDxEjDXGDOY
	Q+4RQ9bsdsi8cJP0BB9dJjqBVw1lpYVU06HnV+BLG5RUG0ImxqUkItD/UmfJ1DD5
	bz574A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs9hef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:50:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97ca6578487so3260059241.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401030; x=1790005830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YjWmSI9LLOuF7sYbpE+FB6ICXzIryi3249bljTKVuPY=;
        b=RAzpEreXqC0vliyf1uvp5UAIRx99Il0XqM7iB3ZonhnoVcubu3hRLqqXu+hwIB1IDL
         2Ubckt756ral860YBV+x/4XgxqC5/l/jQ2v96hjAtjk36KykeZBbeQ5CpXV8lkh2mcd2
         UpfS2vtyouVrq0Lcg59tOl/i86mOsbzxVv8G6oYfcBHbruIOp6hQ440w9SGlkbtBNIt/
         WEG0h1jUhF70of7qfcXhqe85lyKru1Ptjjff4ZYWRspxjVxjP/iFFHQPOO9JOvUtxp5H
         bGO12uY1eiwvuc9HqZzIJfei1m/y7pjVh5CnLOvMPVTrsLZi13DQYNikSlLEL2tVV/DN
         BxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401030; x=1790005830;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjWmSI9LLOuF7sYbpE+FB6ICXzIryi3249bljTKVuPY=;
        b=eAmz6+OI8LYS4bIhv/0Ykuk3KLz47r9EHxyiyXTgzJhzSWGZsm+d7N/ddxJByEaF68
         xoPf0ulqoXA7xUtJjwGyqymgd19JQ1yZ8X6sGSwP5X6hWCZV/U33VA8yoVYSKROb2Jf5
         agpWia2/8lU6wjck/sThuMDiDFj+dNfVd6PkI1Y1iWyTpyoQ6T3EmhcaH2gUhxy9p4iH
         m3xfA1EpmTbUdKhnaaD0UTqxzuk/EKuM/ZlhNUS+9Y8effofC4pj1iWiKPYakdMzlQSv
         bkz97JwT/upmXFr6BexfVZ0tTwBMj/eYAm2wgfY/gCIn88pWcVQBBuTsRBHrRmxm/DC5
         iEOw==
X-Forwarded-Encrypted: i=1; AKwUvBxEBHd07KvCrbjdpruerAimVHZj+Na09nMRM4M6PCaeTTJKOl3E/BXtgu6RkNFij1SdA/5DI9v/wGMK@vger.kernel.org
X-Gm-Message-State: AFuF++mAbSxHODDH/O6NTFrqH76buExYBJaNcMen9n6/R7eeao7HgNi1
	nTWaKyKbjeTWydgsbgv91gTNhfSE2yRzlIt1MonB61/8ewo0aoeJfDrqnng+DdLA2eDCA3q8GfK
	w9iKfe3SJpC6ZYVh56gRikGIiuhLh3hLwaciP3Wnn52DXwYTtYure1AWoVv9Z8ZAL2v7j/2WL
X-Gm-Gg: AYBFou2ZbFdtPVoFpsjIiQvglBY/DyCEKp12+eMyDd7k4OogBokuaUOAiRa4dA6h43l
	7a8PphR77Y/d4onGeF/pgOjfnAjhpJH4xI7IkfILS0J1zZ+BzNc3YrVtuvr+p6eIONe3/Tuqwik
	7ZfEPH8F+u+43KjMY5ML0PhIQhhhIAkF5BhZ0KYgcMGRkWTURuVoGm+cz/rRDagKT4pc8nJWPD2
	NuvKr1KHDBZW5Lhtd56ygEri00NHKItVXx+dgO4SZ/T7tmzfq/EU7F0auEieLD8fC79X6SJ1L+s
	4ExRoxhFJBWkVHrt10NxphzZxtaLZ0GI2ETAV+Iv9YYpHzJUvjCBPfBfeKt+gH/VKDajScFoYRX
	OYlIViZfeBAbd8Qm8qH5x+vy6zlnv
X-Received: by 2002:a05:6102:160b:b0:781:1ac:8232 with SMTP id ada2fe7eead31-79b58393a7amr2922906137.5.1789401030256;
        Mon, 14 Sep 2026 08:50:30 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:781:1ac:8232 with SMTP id ada2fe7eead31-79b58393a7amr2922808137.5.1789401029651;
        Mon, 14 Sep 2026 08:50:29 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm717375e9.10.2026.09.14.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:50:28 -0700 (PDT)
Message-ID: <c4eb78c2-ec82-4246-9050-74c59acf0615@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:50:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com,
        dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260914123106.44CC81F000FF@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260914123106.44CC81F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfXxdumdbyq0Pkg
 t5mIPqjLUq0Edmz8gDDukb097p5wMn0yafJ6fh2/JiXeNgGePkX6HpJVf+cpgfgkJsC67jEDRKX
 XwmVZZhOUbqlPtUKkCmiaKlyTj5f6K4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX+6+/wG18z/W0
 u6NLYZreFVDh9BRirwLg6EPJpuJaI1HbJWlKY0UJiEqwmqB3Us/AotgMHVyF8vKSBrjGu1IEvhe
 D+PEHOZpH7oMVkV9o3FRdAB+WmoCVTGeAjdQNCy+m/B7IW0+zrqVkI29ckydX6Hd8v4X3GMXjLo
 f4VOFY5hZ+ETnSrbGmXXDtFbjJQ+KyilB5MBbMIdUL/CdZ5IQoTUhXev1gCVS4DXYXrUcUlJ/dK
 i/i4qM9dBAzyagNbhnmy+glBReMEzAWonBiQh/ckEPVoULnqQNQHNCo7RWOrQlFQKSVWHhzHUQt
 r2DpoPf1xNczbo3yEof3HEoYbtn+X2pcOtVA2teljpz2vfdjHkwtWeMaHS/baMr1CgeT5FQw6yx
 igjMnoQVoIgVERmYawueUCiCTOjDd9/DGYYh7Gj6atmYoiDAbAKi+dRN7S7nSmqE3VWL8fiadNa
 UuklCOOx0rz0PIburyw==
X-Proofpoint-GUID: lzw6Jsd9YADtVMbmb6rU2qNl7j3ks38q
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa817c7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NWQlD2WTGmgqaikU65gA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: lzw6Jsd9YADtVMbmb6rU2qNl7j3ks38q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140226

On 14/09/2026 14:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `mdio0` block containing the `phy0` and `phy1` node definitions was accidentally deleted during indentation cleanup, resulting in unresolved phandle references.
> --
> 
> commit 3067fd6538b78515dc2a63a2028de505854e6496
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: net: Use consistent indentation in the example
> 
> This patch corrects the indentation in various device tree binding examples
> to conform to a consistent 2- or 4-space indent style. It aims to resolve
> dt-check-style warnings across multiple net and wireless bindings files.

That was intentional, just forgot to write in the commit msg.


Best regards,
Krzysztof
