Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44E2D9ECB
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882376; cv=none; b=is0/U2PqVXjzO0vZW1Oj39FE3lluiCofbqd5zNQDlehhe/dhi3vvrrHoDeZ54eUhoAKI0aQGSuvvdChGMQDMY4ZNyuQp9GBLD6Q5mp+/cjnWjUx1/FPjbaQiJAWA7TQVm9oDi7fR0baOiWG2e1FFJ4I9ch88xSnDYTtDZMGfjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882376; c=relaxed/simple;
	bh=Gn/hPFJr5t1rgP0GF3RzepU8JJdeCMud/+c4GluX5cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl22VkJqT4FrvbWhMWqFVMLig2j6lH+09ogxZd6aVvriNyHy8Mono742HySzS3nOyqkWxpELkV0LDMnKEw0diSmlGJ/g9iYssN3Pom2Uc0XxrqyGwEgMYGfIuBx6bTQJU20ryJLvEq0K/j4VBY/U4Oyl/6WtM/QyqLFkTe1WL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfF9tayj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNxbSVVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfF9tayj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNxbSVVy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JFIaf51113130
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgkNa318E0hGyk+6faDmJPCI0n1qt47ShpxVzQ9DSWw=; b=gfF9tayjiewLv8OM
	ZdlZDR3F0kJxIOUXWDmXEEWE4y5nxwiYcEc02sL6a1SxOdkl2T7TS9PTr3gV8irF
	PkFWYyWCCYvparDoKQUCyw9hiylQooJ3+MA6akV2L7XpOBblPlpiEW25dKhEkHtM
	m7uf0oPRvV576rVfbKakOLMcC6L196Fzf47iaLrF7xJI+pH8C5x0vz9QB86rHfqb
	5NHDGDHxTfdW+ekLxL4ao6+hkqK1Egb6QYySiefs3NXgZo6+LVf2mJwO5KeaFiZC
	syzO1ZxsA9GUi5DbfXUlEaZIyj24WaFTkfCmGDvVoEd5DlqzUM8qPEtRZAW9jMUz
	p/2a9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22cfpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:19:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157263095fso47430885a.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781882373; x=1782487173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgkNa318E0hGyk+6faDmJPCI0n1qt47ShpxVzQ9DSWw=;
        b=NNxbSVVy0CZtdK4G/hPwq2vWwrggg+wyO3PZrfadVolp6naS5GKNNnxtfdYLSSv7ng
         k/WpMe0rEnyeOkVK8fB5Vam5ZIY95APDy5g7WEn1Umylnyv5uIZoSehYOu1rbw7wuWIY
         cuf/QQVAd88yZnXWqPSb8koLa/X5pFRKE+1ySLf9TVHnZ3BtMghJekgAiYlW1SKa+H8+
         VjYei0gyF0thHRiotXxOcepuJSY1skItKrLqVqkexZ7kyneXSodnYr5nLcX1pffll86G
         3d6gVGWPyRIiIOJ44AMJEADlxsg4cDAEzz09IuNWo+3ewjjc9IzRUIQTyfC8R94oB0FF
         ZSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781882373; x=1782487173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgkNa318E0hGyk+6faDmJPCI0n1qt47ShpxVzQ9DSWw=;
        b=Qm7GJSCiFUOIM6E6HJgOv+m2+SLS4NS755iUZYwlnbkQG8d6Y5CD6IkuUhdZuRMkJo
         AMr/ATW9eXH5CDOBRR4QTmgDdQM+xrVtaURrx9OqeMBm3/0fwTjVLM16g5likvVLOGFT
         icmXgc5OHe9+LJTo+WpKKAKXiB4WTdYaCjZ8GbAgEPq2kqMr3CosEFlC8oo8nu/sFrP4
         chyA4c/AXr01so6UJuu+Tog+ynxrddjADgtuSUnvlyMy9gMxsG2mzcTfSWG/wuCyKnVx
         KHSgePg56NoRes11QXl/ybqylJinWTJcvTcGWEnzawLVxPcGwcJyrWJJOMTFqmW3sHe5
         m0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ+uALRU7HnhYtyP2tofkXsbCIxBRZRAiyM5iw1gdOt5SuAToYckn46mnmN0LJPaqygO3fnnG/tCz4m/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qbOtx7H0umXwFU/0iHQTXVBqUnyRQjHwoQNBH0Se4fqbMxZQ
	8XTJFJhZlOrsdSE+iN8RLOqeop5lKo6hsEMqs5gxg1TPCCO+Z7fpQd/ZF7sn1uqS5p/LRGWexXY
	hF+69tKXzPYV0jf3ZR0+R6v8TaGjcvART+bnX1HLRXRvWEmlR8FCrDZZ81o6P9tf4
X-Gm-Gg: AfdE7cmht3GXoussYJcmE9FhBMT77czLYk+wsBZ6Tu0/d1vooz2uXQk+nM9HhZ3Mm5T
	9O0LZ8uLXKlgnTBlhzZ5KPIXVw8zbTEdip8ZRHZUMp6eeTpBDlDHAk+tvcCkQUVIrZ3cHJVBWBo
	oBT0ET/yxvxdyQ2j0V2aLKP8Z3Ev1KpYKJQkH2c654nhxwrR/+hXjXaaP0pl+DIyVEf+lCa5yx8
	3iySl5tZtTxnLAyfaN3e7BvnLlNEnMZkmowUyJboS6TAGOzMSh060ul/tAuvnfAy47uqrPsSSG1
	mVcMRw/H48eazqOX/YaSs1Kv2d2GyVXug7oib1UccMVyzaRvmN9TYZTeaC1AoIBBDzpVpnbkT52
	EHkbKLs9zZamjnTo+lKAo5Vd4nDF4n8Sd3hE=
X-Received: by 2002:a05:620a:4455:b0:915:fad5:9096 with SMTP id af79cd13be357-9208d8e0f2bmr384068585a.7.1781882373234;
        Fri, 19 Jun 2026 08:19:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:915:fad5:9096 with SMTP id af79cd13be357-9208d8e0f2bmr384063685a.7.1781882372581;
        Fri, 19 Jun 2026 08:19:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc76179sm995938a12.6.2026.06.19.08.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:19:31 -0700 (PDT)
Message-ID: <0ce225dd-687d-44ab-9ea8-fe1a77a64217@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:19:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a355e06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DsDjnCkRMD1DqEwLxmcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sM1hMP3sAnOwzPXctRf12ac3EgaE5t7g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NSBTYWx0ZWRfXyOkdCKl9tQZa
 4c6Ys1oIvGMoPUzoTwbnVLy/++prhyvWeSzZGUagg7Tz53c9Tip/Lf1DWvIcR0rK9t0n5vQhnV9
 CnkI6949UNnICwQyyCXvN4R3YY4uro8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NSBTYWx0ZWRfX+cGwe2WQaqtX
 MbUQ2a689TX3b2xDJ6E1zxFLhRAD5+Sh6QM2vbN0TfgsBDXi9bjDlCFo0miWvFLgRN2tY1TQ5tK
 79KZ3GlIcLEqN0+CQl2ofYoeWOAm0xNwjjHqoMhWQpqSaRmDVmO09TA2lV2khiEOCjaVz1YIMso
 u96ohER7rzjzi/KNgw/nQQ9MgRdNmWYTVgmM+MSi34gVpw6S7I/g2Sql8nzw+TlBnt3RdIjCiO4
 nZZ2Bktax608AawQ0PYUXURFd6f20yOmSrDCmFrU5uArdbcvg3VHBAd6kiNHNBgysE8R4uBoDXH
 Xt3oy/KoqfPv9nYJSwGbiJ2f8GNivoEKMp38yaCvS5HPw52rfxyJzV5YyO0Aaf02x/HSDG0nZ76
 O4X8XzeEanK48F5lxDOqnDj+EAYyJJ9qGe0m2RPCkqQQ0ns2jYCEfDBai36j8mczMHJfEoZquhW
 XPDKDZQJqUDuXUrjM4g==
X-Proofpoint-ORIG-GUID: sM1hMP3sAnOwzPXctRf12ac3EgaE5t7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190145

On 5/29/26 4:23 PM, Anurag Pateriya wrote:
> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and 
> kaanapali based boards.
> 
> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in: 
> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/

This is a very large patchset. Please resubmit once that has been
merged, as this is otherwise difficult to track.

Konrad
