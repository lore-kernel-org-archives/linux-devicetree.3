Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF93AEF3F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274607; cv=none; b=YpY1RQhBPBsd8LVtr6hroBBd2rNi1O3xHY+8QFFGYqWlS0hKCtqp2gnZAsY/BRO/mIVNQn5xLBSw7giz37eqUwneLTFyEvMbZ9RhyHmX2RW8o1HVxr2KONIZKfsYs6gen1nuVQG1mfdyiK2zpfcr04gH4lRgC56o6MgOW8GbfAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274607; c=relaxed/simple;
	bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7SmDEYwbQg6vWtxFc2ZnrqGCI/vqkz+jzfZKDlDPZCDsfDYvQUtKy3cqOE4xxeCywpCnI3kcngmS3wAOXEK1ffGavfOPL624b6SrjMI01AeWj0kD6x8uUe5XSeorsw0gxeb49HLlwtlDoUrs7CXN1bVsn9bYNFoba+X7p1cIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7p9gW9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9vmsMkG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7p9gW9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9vmsMkG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8XEr2145823
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=; b=d7p9gW9WUiCTvvKg
	tZetSrzwUD3izJ59InSy/iBUxtsJ8gTtqz+Ub+E/Oue/qkWo6OGGGe/ckd2/hFKt
	ClfyaKsnAazja405OZGnxIkX1YmO5lnyvZOjp5haNq0P/QlQ+G2tqh2E1DJnXFDq
	rZzd1Ks1th2dCk+3LKOiIBKSJbuNYHMYPjTxyu9q16uFadsMDRYqWiq6bQnA8Vkg
	DTtzfZMhqgyxkeEmhmO1gDNNmsbr40SLe1CByxUEqcT3mezhdA3eMrJVKa9Bphyi
	pPZ4S1sbaHLbbxo3yFWnAQJ0us5BL54fVAAKtglLSsxWoLIhFvw1E1FHPClHiw0v
	rSXnRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8u917-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:56:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903982af1so1133696685a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274605; x=1788879405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
        b=K9vmsMkGstQnXaIbnfG+EkFDcOXUJ6fvh60BEPGDxLg2LzLRycDXssiS31euJEJmRm
         1+s+Y53JccRCGvHIUCI3cUxPLux/6+yrF2WYOdkBi1LMWFIeJ17Db2izbrrLOm9GWT15
         YfzKqa2z03EDBBUL+VHdzqjfrJvLg62crl5GgPbUxDrmqDltlKH2TbXg5CK3U4+q/X/r
         LQ0wcjA+RfnZnVuZBW8hvhhqvFw1ovpf9zYN7N739fGeacj6XXGXkGrsTpwLxTsobi4f
         MyIVk2kYy6MaPHLuBsprkg7pEx7Rf23xTgpwQ3fvKFUBxUR58iSUUGvJktBENwNxR2bq
         R5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274605; x=1788879405;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
        b=KjhF3bYY7oLvQq8BLaeQSLx2Qu8pp/sjsmPruCvbiDAnlC/JzIwGl0tctUM4UqdKGB
         W/99+EV4/Qi54Ur1+TCdrg40MeP3+UZvVRSdbgKk0nxA3XSmCoawaqnhBfm8MVyAbEKJ
         7Z8jSm5gPOpH9IqsTMFrsdZ0p4odE92v7g3QdMdtym5I1KhnK9yBCDa10pTjw9htpS+P
         XtDQC/Bik+PSpAn9WqZ9Hu1Oto/vnlMwRJjw/ype6KO37kaMf6q9KGiFcEJEO0DJZ0bQ
         eSiAJWt8yrlkqLRKbas15kHb+7xFRmfje7lgWUF+M8qFmBh1nneMpw+0009whDvVk1mF
         7ZfQ==
X-Forwarded-Encrypted: i=1; AHgh+RprbyRbe8BzUumOxjVMWWVSuXqFFnCeylsnk0E1Q1LicKytCXdFogYEp5zeQ4ixW/jyZ3hDAUVMz3p9@vger.kernel.org
X-Gm-Message-State: AFuF++nyNyZ+2/qxgmHQTs29oIq8TnuMOibFigK9xqe9oKpB8/kVFP+Z
	94Ho3OeFRioQCmXha/uYsli9oiDOiJ0BaL2EVFl5ZUvyuec4B12X9aK40ULlCqtmcOGBGEyOaf5
	0Nm0cMC8W1zKIwgHzLmcPPZe5Sz6hBbmEhDEJ/cXYlaW/qr9XcygZFvAaDPwax8S1
X-Gm-Gg: AR+sD11biRMu+zxOBYSTwEoGK1DjyySAws9snhxPhWN/9cWMz+nq4QAG1ett/CZuuNY
	66DLIlTw8AGl2200YEpBUxfap9T1ME9+H/zN/r1YB+IibqgKf/sPJW5IRgYdrhE7OneQyFpreM0
	W2WqHEnAPm994OGJvmg0PM4jRo4FrXC5ZRqXqXFZULV3tbpyx5gS+0gStBPVA5o/kIbF5rPiDoO
	joq0fX0btxlLPqBlaRMA7NtycVo9m/ZS9OrFd/S0BAB1pzUSEeAQCRXGZjgtnXhZMJ8OqlGCUZq
	POLQRZrvG1Gq2N+nS8gUqujdmeRfPQtkAkLw8RNQ+Kl5ebc5IqVG8o5+qxjnW/yaZmgyP8ow3QW
	S04HoBMe6Q6clS1U6U2r9iKz2yDjI
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr3624048985a.30.1788274604563;
        Tue, 01 Sep 2026 07:56:44 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr3624032085a.30.1788274603330;
        Tue, 01 Sep 2026 07:56:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm302654475e9.1.2026.09.01.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:56:42 -0700 (PDT)
Message-ID: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:56:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
 <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
 <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96e7ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hm1GCXOpcleeJiWVx8IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX2cxcDHSzL+8+
 qyEUszF0qG9Z7XY2w+FKZ+qPoH5Y7Hg5TYBtE6V1tdnG1lo/wI0Yg2YBvkaXiILO6B5Pd6vBHNH
 9RRB6zxgxmlOjrETMW/o4AdHAdEirZxj+U9QihWTn8tvGCc/EgUAqUVuFbw/s2S7srcoEtkk6xf
 yp764xflQmQsSIYUzVL+H/XSz1Frs1JpDMUzQEzPU0aXGETOcKY8a2b76uzF5Ts0yeiYTsYSxBi
 tFsi/8suiOkzLuZdEI8yROPH+5DYHwJRXu5dyzqjAJhhxwuAF4RhnLfN9RBIFGoxT/jS6k354y9
 q6nBUX/Tu/YbIp2tsPS7Z23bDaRqQOc2zy/E+50A5qpy0ZykBEo8ffVZSURYGxy6cKlxcSXiSS4
 glBsDafYf0t4cRTrQgeppxxqu0Y6k7XopdU1jXiMK7TmdSl8aklJHVAIs2iS76dChR1dSb8Ax6p
 7IXWzBS4/f5MHBG31fw==
X-Proofpoint-ORIG-GUID: 6QrN9TTBCpqHArf2rhh4OTIBWYxCOOKx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX/6xI8Er1lzjt
 gWtiXdf5T4ZIUWspzxWPk8tsASQT32qTHqGEX7j+AQdKzU4kQmtmCoI1JrWSO3KkpkaLWLMu7qi
 uaM1YIoyNJ/1EYotYnZiqD4L3SAuzK8=
X-Proofpoint-GUID: 6QrN9TTBCpqHArf2rhh4OTIBWYxCOOKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010132

On 01/09/2026 16:46, Harendra Gautam wrote:
>>>> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
>>>> Usually DT binding filenames are aligned with the compatible string for clarity.
>>>> Is there a reason for the naming mismatch?
>>> The filename reflects the controller; the compatible is
>>> variant-specific. This follows the same convention as
>>> qcom,lpass-cpu.yaml.
>>>>
>>
>> There is no compatible for controller and the only top-level compatible
>> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>>
>> And I already asked about this in v1. Why does this have to be repeated
>> at v3?
> The QAIF hardware IP is the same across platforms, only the board
> integration details differ. The binding is meant to describe the IP
> generically, with board-specific compatibles like qcom,shikra-qaif-cpu

The binding does not describe the IP generically, because bindings are
not generic.

> used to distinguish variants. I had qcom,qaif-cpu as the generic
> compatible in v2 but removed it in v3 as I was not clear about the
> guideline. Could you please suggest the right approach for the
> compatible and filename in this case?

Same comment, literally as v1.

Filename should match compatible, as in this case since it is single
compatible, filename should be equal to the compatible. So first you
determine what is your compatible and then you copy paste that string
into the filename and $id path.

Best regards,
Krzysztof
