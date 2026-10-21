Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591167;
	b=qKHTi4pgAMeBwMEteQv/nPGCMmlYO6G3kQtVYEYldUEVPgmWcqgZKoZRTBQNJ+f2zOXw
	 +aAYMu47HU08SGdlmL/Q1ShxjdlQOJNOjIOy5xJpBwCSEOHotOPRryRG7EaLYZ/O7XpC5
	 6V6JqwBZ+AMV+W4FdKP72iyFjrSLSMIX7BhRVTvKFw6YFT3YeuhHlk4bbPawpBluKe9eE
	 8X6IW0Qceg1fmrugBiBKNNlFNsWOv3+qE3Dic6bjB8Jmc9LswyBP10sUBbeZpFihx7MPq
	 c4YrDX1j2nTi6H3QkXMEl/s75PCU9eSNVCqNSPR4chVeLJEhzwUoYlU1G0Ah/xv/1iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
	b=vQe/BA0u6wO4H7fwgAUGsM+xvhTq4fCf6fHHx9Voud+daqJuQKnSq7vLMngJoON/XHC+
	 9JMnQoiwDuIyjyWlWbix3bcWr8dmJcGD6RV621FQPubuGLj5Zg7ZO9cZzH6L6AsheKxfr
	 dJtfqsFD9nyEnhu7e1sTw9mK5o7Be9RpXHJzmp55Bn2qax1Mwryw54DlRf1eZ852tbf9n
	 AOujeDT0WeU2/b8y2CU4Zh4YGVNhK9G8f/VuhIOcCal06eY8xbzJN46jJraYw1qKRctdL
	 tDg8qPFzre09MrBwAx49J3KmM23Y7Pt/dcrQ1tkoQMd7f7sHxFVrQA5QdUSX62jPePw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF5606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxSb543869
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=; b=HipwKjsaFTPLlEni
	mKbIfwZBmmxxgZFkWfSwqs72ZheXRop+st7cnpzo6zrP0M6LO70KS2wXXNSzwjsE
	+2y0/aS5l/5pRd0G9R9v6ja9BUidUh1PG7noWIdn4acWUvvnjhKduhbpTawAd5G/
	b+lXPGThKktduR3WAEtE3aSrmOYAnO6sys/xP93f9yeFMpqSkjm+oa8Gm23Q5n1M
	GnNZ552BhxARmlbtitdGmNrSrQWm3DjXS4PPg/jkQRiCDaxSNx4ZNSStPwNz/Ua1
	dOa/597Hgf/xoQGwiGJF8iQ3fA9T08Vhd7E4/Pp5R+4xKyihA/JfmJDU4b5jcRss
	8kzCVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj4921c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9bc964so2280296d6.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591165; x=1793195965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=Xc92wjmOZgrL7qjpfUAbZYvpffg8xd3EcpDEbYLHP/pubfyFVFPftTb4r6kiKaC4cI
         CKVSSc12VwbGdfq+s5q++25WcDyWdpfjw9L1u5qS7AlaxBBHRozHm9bEdIsMP15ho3NM
         MOYUldAvdGKfPilzvEzU/CW5qZUEuyNitnd6AJC6woOYaJaUvLyIwNeS7gza0cTEaunD
         qOeVby20lC5ZeprHICPlSYIyygt9slLilxl0oplp61+yGgXLV+33G1sAhj/QjePUYISF
         HG7MOP7+dzcWlScMxr/zi5NmJD0lXYYna9Y/wtjWqRsuImcjNyDLfOoAeGGuaGclnRd0
         XwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591165; x=1793195965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=uo7S3DSVCfXBxy5g8F/sgR9ErY+xZ3/OhBhLKKWBjW4g6sYVtDExMOjPLdcC6UfQuw
         5yHbx0ZGn+iprrzr85Awj+ucnS6NLjMsqrp3eB5O+Lkr2SKw285JYcF2PVStORbS/Uoj
         wG6PLg50fd8y5gdGMkQR3pmStMffwzjQe6gHEInXOj1j4bI6i03OfTrXRVEwqRmOzKpz
         BzBsFdgtJ1+H8nRhho8DMrTAaJ3rBw7ImUICy1uXgczsluIBicm3tykZww/xhEflTEhG
         1AQ5pr5aE7O3EYZKy0ZhO3YNrVoAZsn/z495KeVXMgA1vHsiEHtqb1ZyYxvN4sv5De23
         OI9A==
X-Forwarded-Encrypted: i=1; AKwUvByKcenrMwwP5m8D6yqD5241a6JNwjcfbebjMK1E1ocr0u3/ZVI2heuKLNo+bB2nTysPhcOh10kyv7Tv@vger.kernel.org
X-Gm-Message-State: AFq9FYIZQ/caXvSWNtLlTkOfXiJCxelj2PhN65LhfWrIfavlEinrgGZd
	5iVmw+U4u6jkdEXx8A5hYsopM5OtNvwfVOxPqJZ3jpnQaaZRepHqyYRpQGapeDijvKWoNE8Vfm+
	3V8tEVFQ8NVl/koHZC8AlawfEAnKDkbIrMEXRlwgCDHKStPJbfwU2Qcv7Gqi0yHBn
X-Gm-Gg: AYBFou26q9TJlHlrbVmRwo/K98I5GDDLVWh8xRExzq00/8KCxHjdOfsbu0rhsnT7yIr
	xR5BsqDxgczZUkPQ7UBZaD19DszFYnXZuFfcVp4Lj1XRt22EVlY75kmLmk/r6vYmSLmWKj7BNnz
	CAppQ0VaH8jlWERLmQrDiWu4zlVohw3v1r+AoY+i2FlCY6boqv6dJ9bjEQXLGpqKmg+9Qj5p5s+
	Igpv/9mETy3M7gKTl8f369KpkAacADKsNQBwsNtp/QMUi9za//X4J2PKr+gHOvSGBDc8/7Nm6iw
	idO0WnuNVsN+aeD3SpGuJgZ8g+BUtRljdU0nXscWfP8V9dfWw5XvDrXCrYd17Gbeyr3WDhwW4Hc
	DVDOWMsUMHvaS0iX2jZcqNQ==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481259185a.2.1792591164892;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481255885a.2.1792591164457;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403167e3fsm904154a12.34.2026.10.21.06.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:59:23 -0700 (PDT)
Message-ID: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:59:20 +0200
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
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xtNDK1ZYQqUa4JTaYY49PpQe0pB-GoPB
X-Proofpoint-GUID: xtNDK1ZYQqUa4JTaYY49PpQe0pB-GoPB
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8c53e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wTWGZ2-w8gThuRR8FIoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXyZImRYp9S1lw
 1Adk1kt6bimOjkL/QyonbJxrs5Rlu3DPY7B+haERF17wHbhxuYUYZYeN9VF4TpahMIUd07Fkqab
 ZIUDFTJYI15+x3mbmiho0bPLdD4Zcr2YDJbJkXM4THFMkjESvFh6L8SHRKkaXdsgwLV5PdDCVAQ
 rDF5haq1B8uy6NqSz+RsYpK3l+vhwpcBMnpGebslBA33exdUP6kO9iuv4bGuiZ0VayijWzd/7yF
 3AOO3gqJICEGRkwyxU676rQKEyVbvu+zg/amB61i8tInJ5FFscKcBjsTyWoMtTfJyNEWj5ZCyqv
 KxeNCKzEKqtIvU0y/aLVNc8e3ZMtlQXpIW9IND2gdC3O5NrVlXB5peUUkKsF2/CQ+PXL56RbY/8
 +JLNbDVSFkfN7bohIgEQSmjNxLMkAu5YNoCDBoi3kVyuNBoCNqdTc3CnifhG6wyvm4KKkxuh4np
 kV33ZNQMs/Uf1EUYnMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX9QpL/Jw0LL9e
 pJZ+aIyVUa42lb+eLgFof2tp+b4JmZKfLcLiar6dybKFALWNIYYgAdptf90AR86wrp5fuegFkxP
 mjltj84o5SCGUnduVUomaZfZvfz8UxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.

[...]

> +			      <0x0 0x09191000 0x0 0x20000>,
> +			      <0x0 0x092dc000 0x0 0x1300>,
> +			      <0x0 0x092f0000 0x0 0x1300>;
> +
> +			reg-names = "csid0",

Please remove the stray \ns between each pair of xxx and
xxx-names

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
