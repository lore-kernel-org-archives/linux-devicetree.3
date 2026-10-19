Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968F4DA9B5
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409918; cv=none; b=DcTxZaYRtv/1VFXhmWXPY02C3xYqiqzY0HQSKT9Cj7l1dor5Mp3QRz9hxL5Kw2BnA3B7ogCbedBAmxkYx/9MwoqivHRIwDRV7YD0jGwV2oI1SbebqpbfWV9GnNaFVuNRVNeBFILKcIWIhC8oRxViHGjhZSdEt3FSo6mrTj1bsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409918; c=relaxed/simple;
	bh=QOs3o/03oscCxG01cilEBA+6SNpiI2kfLVpehrEqg/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqLrqkXizLQ7WOLy4tUbu6RuJLTuUjEGLhsFz1xqKit708j4lhgQjUIW0SrRth+6/f6y1KAtIuyKmhTBuAN43zEv+SrJED2Fr3VMjy6kVqzltm00Egqo2I6YvBWItIQUFbWt7AyWr2lRYoYY6XgJCIx5OA2Z0+ba9cose5VugJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHQGRQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsYmZ0VC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inHQGRQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsYmZ0VC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P15v2041974
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=viCG28a9GrMyDHchBbUccE9n
	1Q9GobJDehgmh2qVkOo=; b=inHQGRQ4nY1ZqOcaxktOu3V6O8YYVWRjNJ0n+99B
	1WBNx16s2n4KqTG+fjvZUpYKd1/SYax5M87hkceZI5HswXLv8qBLlUSIduP4E1JY
	yaCR1uxyGqbjht3Y8o8Fp7Ck83V8zV0mnTK+cjaO1MWw5pNEOXkCySz1k8ySxEvj
	bfbfuVHQm0v219OGpTTk7ZHnG0TkK82PvMB11mB4HeiOdhCNyIfZ4LfdLDJBcsx5
	V5jxtw8cEhPm07BxaN9VdjNnBnh62k0FUZ8C18ee8GjA2z/x81BkjdOAsXpS7HGd
	nSvehQOC3+6N9GjjPwhK681N36Qvo8jHZj/ZB1UlwLWkXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2gwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so707897985a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409914; x=1793014714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=QsYmZ0VCNERu+UBwQ/+ogJkityK98jcKidh9cHld1JxzUSvjgjDwC8yYbme+acqI4y
         l2Yux9BlfNbYJx7OvFt8zPCyrAQr06X/nvDkGYK0c2H8XPQTy404pj9mGkhutVqQ02Qc
         dSTkWyK33DG1JOpSuFRcYmd8yCtUA5b+ODApkk0U8tuMl0/NSPSdxe++cB342n2STSp+
         RXRCaX9D4gHPWfrVC7CszRIB4R2UTyY+q+Khf9pa3UO1cIaQy+G+cJOnc7SuxoWrzduv
         qqJaUv/8ulFVaIhQji7r34e1MlupsqWA1eV+a8+Z7otNDND6KLBh+bpDIE/HyG07vsgA
         27jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409914; x=1793014714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=2Te1a8RA8wM5g/ikpLWjAkjSOr+i0T0s0c55a+C3LictR9zw1r30NPNpPqQvmfujso
         kKZDTL7IAIC77cnZRyQ+3917sqF74T0PzXLXl9L2yEeFVt8jVI8jvsKZcqWrlLhp9sCS
         pxMKKiIXgH8UqHRGZKGmWVI7Kjyjg+wAhGRQBsw+aGapRIc3OAVTO5LvFzEJ5s/c0NMy
         sCpnR+kK8rwHQCwSC99Qnjxrj35/38cWWa9sVyKbqf+EtlQXRRe5e3lFFVzQePxddzis
         rL3FaK12MxbGLUpJj5CpR2xCxsEIDCmWl+V2+GbBwV+b9hpTzeGzLlEDvZOiof1kQ7uS
         EkGg==
X-Forwarded-Encrypted: i=1; AKwUvBx/fYjY+K5CGZj7qL4K4P9niYYHvvw+HJnMUtTAlIg6yu7bct/Rrh61izmuFvKROdEh/ic8Zbsf9gHf@vger.kernel.org
X-Gm-Message-State: AFq9FYIRptBMeiP2bo+4NCQX6JLRvgZThjDirv7u50iDnZhcXFwHnvEb
	0X2sMiTHzTRmgNoUM9byE+7R9Gyux3BoHA4ig/i6I1jDbhkjHAdh3+jLGKZugRsR/KZqwXh69o0
	j53mKtdsFKo0QjittekVa3ep1P1K2cnSaTRXvDEYXZCPI731dws0vFxKVOr81EvW2
X-Gm-Gg: AYBFou3uC3o6nAZxr7mTWG6fwIlX9EAir2ofM1vnEv5FG3uDXKpfmwvkz1K6NrAl2uq
	266E1Di28z9RZEqgcq2p+ZWUDxY+ITac/ybgSz6WRlLrskiIWYuykMLJVoETg4lQTZLeb5gRke0
	Qqh9wnddf1ToceG4rZtS2iormCOqLReIW+9OI111VWEi52TLms2QVHxitD3VFsRoYILGn8eGvZE
	JPNe0okBT4maK4gmceUp3VM+X9iLcmAGXR1QL3MiiapuUUPbyvXU2is4kk9mTWIgoGaDBwjuXWu
	MODrEDwpYyQjjNrT/1jd5gjXlv//5zK67Wzh0obMOqWBrIP358sSvMyeD+IyCYEh+9ic/Scqu1O
	LrRspFPg2XqOKhHMB
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247869385a.54.1792409914290;
        Mon, 19 Oct 2026 04:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247864285a.54.1792409913562;
        Mon, 19 Oct 2026 04:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm22148555f8f.50.2026.10.19.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:38:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:38:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
Message-ID: <v4tz3aztvv5cenofrksn2g3amauzq77sk2cakvqoogqbpbmuud@cwdziqxeccyp>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX8sqTlocDeQzN
 Bq32rcmzEyz4GGuzvK6wPcqQjvxqnefuvt20BbY61tO5wVrNa3+nvFdRu4U+EZGKncqJLCMbC9t
 yqJYLzUE7GCWUAaPkitSP6dPINLnkHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX8Ftb+XhvaBDX
 o5ZW07yU2idJqI1dR3e++phjgY+pVwB9kr27ytkRj0+4IEjVH5YvQq34/6kF8733N/Yfb4QwRiw
 U/3FuYErRX23KIDpFQx2qPWnCc76QgqIb69B7zROZBAxegWs7IMqdbwlsM7r8qEo5WjK8obJKGX
 TKr+GYJYroH72FnShPu55OTDcoJJtOAk8oUFKTwmaLJsrbKqVw32CRczSX7udbt2VV8CkqEyRy0
 G7/QbFBntvOhYpUp/zPr27Wz8ZoV+S6Pz+ac59tn5oBGxNRVOBd0jyaMh30uoKYvvPt0O5lx0aK
 BUbFukrOVr/26ZeNi7nyESVHwj57OIwJIyo1aTCoTX2z5g8h9qTcORYhWc6hwfEZpRPjR6jyG3L
 q4+PiWfANaCzHEzK/bMNGo37A84bp8dnEq0pIlVrE/jgQebEwlhw7TK7qypB95Znk45S06wpkkr
 Yj9DZS5mxMMfH1QI10Q==
X-Proofpoint-ORIG-GUID: iSxHs4T8Cpuxdi1pLB6aMA6hCvitCIXb
X-Proofpoint-GUID: iSxHs4T8Cpuxdi1pLB6aMA6hCvitCIXb
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad6013b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_C40RPqcRi3kUEhYcr4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 19:05:04, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
