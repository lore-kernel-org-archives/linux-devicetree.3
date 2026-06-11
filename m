Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051D3BADA3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168299; cv=none; b=ENh/4N+zRc6UZW+biKdcEcKZZlcg2pJ/EzYhrumpZtg8qnR9z+AXhLryplBJufyFSicnyiRcpq4baHdLOtfsbWe8Zmbgr00T7HkofV6kmnQqTcrP86W/vfEiwnSpOryFLzFRJm82vWVgvMly20mgjDouL0eVSpu7987W/vLqh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168299; c=relaxed/simple;
	bh=ubFETAO+a3w70T+gsV4lJe3JhKVw3+NojPxTy7c9xX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HL6FPVGBNq/x0DT9nVp/7IemTP2NnAij7axZj43T34VLqFFCXoZjGiPuLwDzxsuq+wdw6pY4VYeU0l3Ns41KrugixNwkHG+L0yD9S896BF9tpt4WUYfpsngiCrGpwryKmiQN16f3XuWUGrRR9ctzgtJurHCZZ/FVwVUAwMVwFgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlsAmkFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKGRfUuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlsAmkFC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKGRfUuw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQps3863687
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITeoqfYyx5/TvB3iCArGaMCOG3SrwvleWOuIq8Gn4js=; b=OlsAmkFCv2uh0ops
	HH5oB2YzN6BpvyWnd4AIoo7SlZN3xyx3c+PyrtLMrzVVgkPTRdEnnbbQ3cBQrzf2
	Z2LoEiTQnTwuMynkIZaMfmZbLUtqnVljpzGgtDDnfxvcSiUeUEoG1cLD0QHCjFrH
	IO/Fp41FeuXdzd0bbMI4J6yjlaVPP7BIjkA9woYkPEnMH7f8+Vv4vFRqpdPJChvB
	F77DufTQwzQK3L7zsYqJqLiVqLMgvNoTkxD8F8Y3nfCafnXvS+x0CoIQmLZ8UGKm
	nsTREaVva5/Z6KwGACLMW7lHdofjv8xwH5yacXxtDNXgbZfFsqs8hFgAnmUIqG+6
	2qjWCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjmgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:58:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso188954285a.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168296; x=1781773096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITeoqfYyx5/TvB3iCArGaMCOG3SrwvleWOuIq8Gn4js=;
        b=CKGRfUuw9ktnYOXSEXQNsLwIWvY7bTAvr7C83En/yM5Fm4DYMeZcHEY2jvfZAaKGew
         WZmT80gzromVQfEIrrtxK9O/Vr7tDoL8oIntlaAnadKtd1MDWj2Yxon4bKVnxfEuztNB
         YXRzTeU+L7mqlpbqXw6c1T3WuGcpSdoLuFKS16u3K0Z9YseCgpFeaJENlFcVJe4El0bN
         hj35DwQH0WBoEke1q/msBcAVKqsJByJgVSUwYYPQ8U7RBN2ul2NCQOa5rml/hWPkwdM7
         tAQPLoDwbD46S1aOMHU+3DIS2H5DZqAIBAIwqdcNEwYThPYPlyMTtcmfe2Nlv7A6ffdG
         /6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168296; x=1781773096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITeoqfYyx5/TvB3iCArGaMCOG3SrwvleWOuIq8Gn4js=;
        b=frsEEQsdzEiO7XCRTJuk+TQNSTrHjDq0msm9HDkRmzVuyvXy23fs+ks7Y0ett3EhW5
         ocRqJciNJjN57JheZqzdl111QyhrvIhpZhq0GX+5cfbBKbYSj1cQDbkHHJ+tpF8q1mUs
         cf2dsUGf7rgxPVFGqPMpeRk8mKRk1YLxPIlqOte1CNI6VfjZjwrvcjyOPkp+b/Qso1+q
         qs8ii0hLlj7I4rE5Fx+DE0pDQOGflHLvwtXeObpCQaeAIm8f5gwXKbFekboymEw9Xjg7
         zczvEmRc2mg6xlaAR7bfXkgFfDDQnnLWjVtBcSbDClYA/TNtXOiLwk8rmb/mJzUUVIPg
         7I9g==
X-Forwarded-Encrypted: i=1; AFNElJ/yXyQxlljh33Eif5Z3Wh7IJk1yUL3piiLvFju5qIJYAsVUvZv8ply4ZQRGs1N/PSU1R6GpoKzuvl9x@vger.kernel.org
X-Gm-Message-State: AOJu0YymgUGyc+EE1Rev/2WSA3Wtb9Q00T94nbJn6vU1sdnMzWgtS13v
	81SIq7CHp2wCZM7PhODqADLcMp14h6V8FXkFp7rFJVm3cLD6jbRWze+ky589EeqFa6qoQsn8tqn
	H5GihwI71uHE+IFxiQKrc3AMGGCacwFYO5r4zvKHO5UUfOQVP3jA6fGQo4B2qpkZx
X-Gm-Gg: Acq92OGGUEIxCu7y+uZbWtyCJGWx2iyuKPMAkeNHu39zsIjOUSq1hDsmveDUBAEVEXT
	ER3B0epqgsSjFyxNiXZ17HD+/OHML8tG3m+50dNWtrFIL6PuQJ9Yhif6Za42Yxu4soGbgcIUJa5
	nJrigk3g5Jh4zk7Vf1IlGqx/ef4IznctlthfdHKjTI5hWyKWjIiyM6CrvD7BfQJy8QboQaQxA2G
	y6qojl1zVVbMEBN5Jo94l52VPoidbBJG3JzkOpPdU0koWKPzjLiqHPAsdy+UT7m+DXccD/DTYWq
	Qhk9LOmDUGO9MGCvFlHneuW7p0HHx+CDqUlym/gkLjkooig/jIH1nsvD55K5GvAsl418s5Y/rmE
	Ewc7tioBM9DsErmyBmnV/rgGr7e+sqSiFkUHt4YA0sOwagmmeVUQ4Wz3A
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr155517485a.7.1781168296428;
        Thu, 11 Jun 2026 01:58:16 -0700 (PDT)
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr155514585a.7.1781168296012;
        Thu, 11 Jun 2026 01:58:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm10678980a12.21.2026.06.11.01.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:58:14 -0700 (PDT)
Message-ID: <56f60746-c35a-455d-9991-7672d4f0507f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:58:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and
 l9b_e0 voltage for SD-card
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-2-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610111508.3941207-2-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k6ayyGRFr7yyVUhnhI7oZBXNmKgf1LWH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXwqK/Bh9dFvLL
 GIRER8PtQxqsKETvM71ovlrL7QktsE0YO42zSS4kAIyg9K1GQ1lm19CToAtjNOXTI+eqva193G/
 uEAffZmBlNyYQJ87H0baBfZR3VoQqhI=
X-Proofpoint-ORIG-GUID: k6ayyGRFr7yyVUhnhI7oZBXNmKgf1LWH
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a78a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_FQnCXsvKZllb7IERd4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX5wwjM2e1FFGq
 oOh+0KyEuc1dxexokXrMxGqkZAZ4OqHGYXIsf0O4zE4vmv8/SJB2fob6fxUrLHz07nRXRuKHzYn
 gz1heU/4m2full9AOhhv6OT+i8FvRyHZbjDuyymkpfOCl/6r0FV2Q7UMW3bE+R7eKb33Yt8hmOm
 wU9GvZvz6A3XB+KJsTz//brZ1m5BzibeJkBvNi5cCuqZna1m6dAhxoHMcM+imFoyEZaOF0vJ7pl
 FJhQZ0Jg96VoNQ2TPm4Mq23mKgwhNfPj5AeNyRo2+coaMvj3ZnkcTMPvczCk2cOzSdw4ZPry9tF
 mL2N6rysChzL+cHuyfsmUKUC5IPpJ7wK0HhvrqsxUEJQWpGLPAn0yyZj7MPnEC2TYy6BNMnzVMo
 dXNQeSFeK9Z45OS0F4y42Ibxp7LSdnLcAGGSEMhqyS0zf2q+HmPgrVrExg8XZN2TXYLavqTCref
 e7E6QT6t+zed9AnamgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089

On 6/10/26 1:15 PM, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
