Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4235E958
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684631; cv=none; b=WYQQGeIzlkJ+3uEmBBDMlzHjZBapdGzVlEKwDbc9p9s3UxzBRny5zmzCcH3X8wDBbX36npqOzLnZ4NrClryadZQoS7p+v9A+dfuApV94wnzzJQDQrIRQd/bq545OYEEZGnwwZG9DzOSbRgPEYb9w27N+UKyItXnRCCII1JGkUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684631; c=relaxed/simple;
	bh=9npdYYfmmoEFSOdMRuCF9ofpjtgzf0emYQNLDswd7Xs=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=dDFaMmcjjj93bLXFksoxHN4IL2Qwy0IjHuBwSWZ7sRpAbomqJnfbTaelCZwrrEgfm17iuKEArT3qfUwF946Gc1Yf/PhegIsj5NoolsLhFdhb3ItUJZ5IlWvDZpW9qvANPEEbH9JKWXQxVpmabAwTLbu7pe1G0CZnXmyL7GiN+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LA2tnapK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqdzqWd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LA2tnapK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqdzqWd3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CC933275328
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=; b=LA2tnapK/pYKtxWP
	x0KoCjHcR720XIxO2Q5RhUsqy09mUEr/sUZuGMr9pQiQRnk/7wedO5cJDv9J4nUS
	UEHhgIaLYpSBIeq9qxQbZDh32pklvVPzDNKeUVaf4KhQQXI73X4L6fpFhsFbfUSZ
	yoiy0b2n9gmxuaG6Rd7pBnVraf7E9nLTsi2S1+pluEZTnePAHD8jFrZEEJifKeKk
	hoJsa2vSQOW8krNh3EjZm1NYawXHVEjuWcS9dFWqWVyjP6tt5ntiFhvc1rrXhFKe
	BhO34vx4ouB6U0W5/ebWZg99vVmNN3FpUQaUx+bYvyrkN6TqedfeULNMlLeEMAw7
	+vpAjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeb2ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so5354154a91.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784684627; x=1785289427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=;
        b=dqdzqWd3wK1NDFy++lbOj0nFtZLdnLpPlcMMgBz6151Eqgx4JpFRWYzIDIZXQmRGdc
         +rBgP+UiERvEw+GmVf4C+JrDRWJ8l+bDnLji5LVPS6aFiwXxiPp92S8nK1Av+E2fz302
         TRyxSgfJKrCFydti6JvgBjbxNSjSuJwG4ereuptnt7FTjIWq5cHqnDhJQRmhtJPSWYLe
         Ts8mAi2lZMzwin4eTiY9Fs4QhHJt58sODsiy0VekIM1GaMS7q83WeoaeT26Oy3PnUaFx
         lFMDP84QFJuLLXsmRZKAdrfqX0gZA+Tkvhcbo0bDdiZxYjm6tXzv/FNIk32+0yln2Uj+
         JWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784684627; x=1785289427;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=;
        b=kSGZsl7AddJI0gMNA1ZEpwLqQKiCFkgBKOvmBr2fzB2JyxA6p2TrsCg/7lLIJLJGmH
         KRIrxJz2dN+4wSyCvQ0PUwqVhMEphMFAmovJT01G5kfYpxicUo8XCRkgve8teCbloDC4
         yB+UjuQaSuwAG89Wkwvv12oS6m+qF+XZ/rqEUgRSqJM9h3dOFLRgD9GOFqHd9EkorM/v
         OxAerlaRA6OiK6s7RZsKZC/HKj9QNVfSAq0xA+qXvjwUogaioKEneexj2WlV8gNCKydQ
         sxVUGsoneAAXy4bT7/y8Esx5VBpZ/3nKOAECyatrBdl2NI4d/AppYnQJYL7JWjo9j7Q1
         yPjg==
X-Forwarded-Encrypted: i=1; AHgh+RoRhPiRghGZrPsUwjl99DWXDaNySrb2OQ3/5YFaQMwBoQ4/tlNQNmQTe3MZ/uZzmWxZMajpboe3xhAw@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqPkihBzTFPmM0h/QxC7wsayohMcO7SllpizymxAfmNb/6j3+
	anC4wYGJ7SH5CeKqGkCWA1Tlc/gbp1eW62fzcVfgvT5sLHLy/1EPpeR3Sb4PlD9Kyb7HBtp5Bn9
	fv2WuYTwc8J4HcGi0ZZ0zuOM2rCF5lU+mBzmBl0wKk29/39kHeadegv9W2oTTc2Rz
X-Gm-Gg: AR+sD10Q7YunbejSpTGWTTkyTL4ok6VRj0tmjkgyi5MDYJpfJ3XpTXWd0oYYEvcwUXE
	Vf65DTYP1tQGqckIfmjwGw/b2Bu8vdl2BU6U1w67g7egmupcOekLWY1Tmh3rmmR0EU0mftO/GxD
	esAIVyPQb968uYKhsMTLUPRzYOwH6Ev9BqWPqNNUCbxTDiZzso/S5jxlZLQ/jTuEUQVuQ3rLHrJ
	vwbyRgKyreOKQ1N7EEgNFLywDrmiQOrFzcDZ9UPqQYgzhK7TtI9GtVoS0P+qBRWDWKQXz9YPPiI
	9ACk2joFNG0utZ5Kj7AochZctSdhHm2thu90JKyxgJeODH2/tV+eRqASG5AUj3ZqXQaDMH3b/cv
	vx1BP3FC+RJf/9hDBxXoioX2R52Y=
X-Received: by 2002:a17:90b:2151:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38ea3730563mr1080341a91.21.1784684627379;
        Tue, 21 Jul 2026 18:43:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2151:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38ea3730563mr1080313a91.21.1784684626820;
        Tue, 21 Jul 2026 18:43:46 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea755dcc2sm199136a91.0.2026.07.21.18.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:43:46 -0700 (PDT)
Message-ID: <13de2a87-308e-4cdb-995d-b49fb91293ab@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:42:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v15 2/8] media: dt-bindings: Add CAMSS device for
 Kaanapali
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
 <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
In-Reply-To: <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1-fcfxhfs0ZWMJc6b98fH8impgv0qz8S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxNCBTYWx0ZWRfX0lM1bxcMnTis
 40YmfR260LypaPPT1cWzloyO2KG7wQPZGL8HTlAt7O/BpxjkFYfua0jkcmktNlBJ/CAj/IVpMEX
 M2KID+poXxkfL9hCGOVZGrAjnWV0YEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxNCBTYWx0ZWRfX+yuqrIROwjK1
 oniKc9BquDWXZO3NFXgO+Qu5/226C7E0XC7lkR2KOVn39twgI0gNr6HC/IBiHDmWNAdTIXLnwA6
 AKnsd4vt8fdDM5+KqCdJlxL6fB055momULqsWz2G7ysIbmtYQzOoxC7FOpB2t/WGOn9GMq9ryZe
 TvvTTV37dCrPOyoDMrwYEMKVYWtM+SxQMGC+TtyExxzz4Yc5F3LEUeoAvhYHxj3N174jt0aBl+6
 WWWdHtyDxOianWpi2Clkndirh6CrBmgElFRO1oJTlUF4VRgK2kUDIMs5iXGISXc51AU++DSsPbV
 XZ06jdrsd3ItO2AjyQ3lLjZY8y7MAbQ0wyUqUWzd8QFPoq9qdXoxmm/8N36xxK9jnneWQQaHN0p
 7tWml6j2gWLZ46Yh7Tu2fr+daatF6YegXxnipuTV2rPhUQwGmTyFBNC3YtOT/pdm4Jkzpo0C2k7
 GEVOSZw0Sl8OGfQgxtw==
X-Proofpoint-GUID: 1-fcfxhfs0ZWMJc6b98fH8impgv0qz8S
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a602054 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=3WjcDeQli2E4eB_Ao0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220014

On 7/22/26 6:41 AM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 21/07/2026 05:50, Hangxiang Ma wrote:
> > +            csiphy0: phy@9523000 {
> > +                compatible = "qcom,kaanapali-csi2-phy";
> 
> The sub-node should be dropped from the examples.
> 
> ---
> bod
> 

Sure, will fix that in next revision after you post v14 PHY driver. Thanks.

Best regards,
Hangxiang
