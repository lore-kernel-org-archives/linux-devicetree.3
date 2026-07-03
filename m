Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226D2C0268
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063176; cv=none; b=pETt+j4tmV6myMcug71G35dIHOPTYHOgHJxY8cVk1DOg2B82B143fXp8r3sn5VwnmI67MEwhCouNrAI/UwLd7Icip2W1Xwz8ykEwX/LC+bmQhjfpzjXT7lSENgIWDBTtmsNe6SLBfmzkEVZ1iAOO733zKF+xZaz4B3h6dXTMVig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063176; c=relaxed/simple;
	bh=1BCxRF2o+/JRgWZS9sS+EH8vOIpCuHx3ZGtchgE5LWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpNnUndv8t+K5ZUFkyzu75IMt9AdI7le+lfB9NZJsH07niXLk6P4pQJdiNdvAqQVX/WvSrT+W+Fzj1UkxCsYQE74kmgdiqt83AU0yF41XWbYDperZ1sV42N6LiClvk39QF3Akt5qBRdQ/QnvUP30btLRxTKoUdckEbRA6u6ksZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oREh7p23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDrjyGfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oREh7p23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDrjyGfN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rqtZ3135225
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=; b=oREh7p23boKSEvoe
	HGtqMiOS3JkJZFu6pokW1nlogxvXspqos5SnhWGkEksNy2C1Cq0T0zyhdKE/p0sF
	fc2wW35VfduRT2+DUDlVCZtEytpIVzguM7TQgZczpxmr1TwexG0dR1iiGK2R+J1Q
	kkuEUt7Kx6fWXja5qUIw5G14qWGUwKmtmUNSLzo9oxecBkOlv9vTgMRNn8Yh5P/z
	RBLdcCFcq35Wf+kTkySrrR6G+xLKJZu7RiWgexskAQakgNawyIEgNFRbLEynfs1W
	ye6unbAW8KBNQsDFrYdVPHQ34ddiQ42ss1FbHJpKMHhVoKD28st6xxR1tadtsoKu
	GQ8Upg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcgw83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:19:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so1990651cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063174; x=1783667974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=;
        b=IDrjyGfNQ1IRfSz/qxOs4nlsh9MRk0vAjlA04Bu7Yicd/hcW/nUgYKzqByOop3f8Dw
         hHWT402b2Sqlxgbm0sqDOsrtZrpQNbP9lpG6J0gol0aA73APftqMBB1xUP9cLsxik5Qe
         mDTksTnZGuzTipeQL6oimARta2KbyNn5uCki5ZcvH5Sb7WDpi7ITQHHCZfATBg26HY5H
         ZxR7AEugAyY2eIHVlyrLyO67azmVl++4Q3nLntKphUx8P7uhOsOiIG69mLKkBuP/f+p3
         JhxCuxuCoWa+fvsWXEtzXd4KrownSUf4POsaZOJb2eF4DAl471WcgBfPxE/Vyz3fqF50
         AN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063174; x=1783667974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=;
        b=NgJB9D8ifZWBh0WvwGr4yd9xJIfjBySqK31iEvG6AvD/9PYgJQGBlbaaSJMZR38+gO
         qfqjh9LiRHWPL4pSmdTS42fMH1enJpjF0vtnZSEZzbAFmLy/e5q2PydwIargkIc6nncN
         FxwWdXz9jxKuVFMDDMKsqx+5KKCNRTahZOZTej/OyOR9IK+5CsfOknYA/jvdR50F8TZp
         4JvoLaqCPX/0NyV4lJVqhHngHyQnBDwwpx588G0yi5P5DFIiapVMe6A/4IrX0AjFEN9M
         K7Sk4LUfOGGC9Inn0FjZyvE4Ii/tRn7b+3YeGJymyKWJTZ+YIruaGcm9yl3sjmBXwUu3
         8RnA==
X-Forwarded-Encrypted: i=1; AFNElJ9kGf15gEDvWwPQsyVnNRNvaT9JCYazJsG6xfr1oJaO7bzedSyfkd3HYLsOzdSe/eKTfSAPFLvu+oJL@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBT7N+ckIHkDv8ptgU/EsoS8aDA10PeG5oIhXS5Alxn5GxuHE
	4CVot99f1dW99vC6DPm08oJCjC3UKdjVIEK6anSM6i6ygb+diDdYHsanetfWXrtX2DQEX8trBaZ
	O8ntPK8tL+60M1Zq2s2sUNX1ufv+8yhh1TaaLPfKSKmBzSs6ld+W6GnPrqvhq10nL
X-Gm-Gg: AfdE7cmIcoS+bPuMVBdbhxBiryobOORnbui3LN6PCmDU08HcLEq9geYP5vVY3BexYnj
	1GE82qq60m0yUMuxLkgE2NHbqbvRwIh6jjkCD0+8lOKv1iHdBytlCbTozyuZhilgGsw3sGrWN6y
	OSkhTzNFU1dKJ54qCVpM4XdYMLYsCDpr/Vl4OVSzwOaizjbHd6dRSeGqmL+U/Tk6LRK369skOlb
	w0l5d/5csU133SyMWNT38Ymb3oDpcdFWfZn5x3nig8t9GJVl1eGq36hn1VO+BLDwvjzqNFzLbA3
	3ayOu3zt61XdJ+4OECX5rEr4fjX+KXQ9DRUNXUSsKd55dp7A3eik7L6MrnMWVikbcISkFAcyM0N
	p8QFEIGbG3lJBj8hsd1rSuP7OTbwQK4OwRbQ=
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr93225601cf.1.1783063173798;
        Fri, 03 Jul 2026 00:19:33 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr93225471cf.1.1783063173438;
        Fri, 03 Jul 2026 00:19:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm236606866b.4.2026.07.03.00.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:19:32 -0700 (PDT)
Message-ID: <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:19:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pgZ6JmFthxlQFaq5jWVdZdQK761xxSqa
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a476286 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-A7SvAB7cpwXWzMQEzkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pgZ6JmFthxlQFaq5jWVdZdQK761xxSqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX8qj/PAPVC8B0
 iszR3QuyZdSK4aOHcNVLE6gDTbPEipBvRjXMjSuBQOBaG0eYOogLWl3xAyJ2mQWvcPJ/f/ht23L
 Ehv87KX2M05ZpDOttr84YKgFDLthUDxAu2zJ8HtZuA+qMVGrwr92m3ngyCfEkUGj5JkRZULujBv
 jnctRa7issG0epl1fmojAoflMrndTFvNuEbiNsTGwCiw5lyXZmBLhtBcXptlpYuyJYzW/ji89cc
 5GVlqCSFj2yxRgVfhZ/JaPcrtTRFYmsqetYvn4OR8ojbLBYd2VYkxPFLbo93w5xucGXuhofA95q
 zcAsLbfhFyDbqPuqB0T0H9BD4ARXzGZ3Tc0EJVlSiFf7ibzayTfL8VG/+VnGr294pz6Zqs3vciD
 tmL0YOkUwvk8TcTGmL71JxvIkKJzGCm+kUs7zpAj+uudErOkg2tLFVjwgsGkEQvMFSGZs14v3v4
 Hk+OmvITEawnIomtFVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX6PoErM+OihBF
 eVShVsrKYlPWkh8kNYFEnv/tRdUz5JDHa6w+OFeSycjZMhexkJeYowtdOp3rdl+h7wZm0oNgjnP
 QiWrHehVbw8VjVeh9QW3QVNhicum5Vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030068

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
> hardware default values. Incorrect settings can cause the GDSC FSM to
> stuck, leading to power on/off failures.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
