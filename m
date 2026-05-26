Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D2384244
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774414; cv=none; b=aVBmK1Hwa0ShooOWFeyck9yJPdGb1wgE8Dt4hdk3rgZRJdtU2Y6pgL5U7k7X6lYDvIRron44fF7hPCnFIy4b2+VJTqxa6LyMTMPUIXAjGNkkprDynzCBDRVT0sVSCklDuuEPcIV24TG4e/8gG0gdFkMyVFQZUWzV9+L89vNtjyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774414; c=relaxed/simple;
	bh=ps86Ba0cCUSFCCDq+mkUy9q3KNNVmGXrUPfYnf/43e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSsVOKSOULh0F1eIH3ckqiQlCxTOd1loLnUC30BMqJtWD/Ec3EOivcw+FCvstIWHucH8xSNPzT00DCJAzx2MG4kjsKmXtPWjQ5pFr0AJtALEutKo1Eu5TkwAwoT4KwpFo1xwSxM0yZxg/DsXuxnS3SqibFUDBENcsvUO4hR+pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxat4nuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFMYY/h8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxat4nuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFMYY/h8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2nlx13657998
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2iFik4hUuN6UNkV/R8eN+n1d
	H5ylNRH3jiARbcS/5Cc=; b=oxat4nuDfKuQv/hYmzQCgEx8keRSfS4jWR3VeffE
	5tsCSCUxEOzhfBZ8nWPNnSyZJ6RvhBfEbZVrQTBxA3qi8IZC2ldtg3QffX1/6uVU
	Ru1OmMk/v6+4FIHFWkdXqSyCYZxXtUprpxBpkcPcZLOJOFlntNmxz+7J+N6xN/Ig
	CujLMJ4mLljpnNERKp+/iDcOkifgFJIZZYBBtpt7p2HGo2S9Ppl7hVwKxWmQsB0Q
	TI8pmc0JavRl3B+IAWwnud/twEJoOEVLLsZsJQXJJvO9kWgWKZhrOk/1fxHuWdRi
	qEkPxcn+4khWSMeEEe7DQeExVYk2q1fJmbW+fgb0Ad8mqA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqyna8kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:46:52 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95f5daf2d5bso13974930241.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779774411; x=1780379211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iFik4hUuN6UNkV/R8eN+n1dH5ylNRH3jiARbcS/5Cc=;
        b=hFMYY/h8qa3eEtDG9IySoJHy9W5C7/7Aj9Gi9sPbNLvdHhrzlSuXoYe1Lh/bf3uvww
         URgygwxV+sCOpMNaG3EJaNzy9BJBj5VPp4LouiOrfkzu7757p3JGZBOXXXI2oNi+XCbj
         0nHLYhm7evGF31oHOoF0ncgQWX51EPuVZ2Vpx6l5j13RouBERap7IQuxP28OFFim/dy1
         K2GfaR5nT6dEhXbJo/TkNJXp/xybol2KxpkRU4rHhf9p1J7Pjl3z8YITlYE5/Fte2E3K
         hhHpDya8LqCm0tkJL3SF90urrA20ctRptcl7ME8N57VyJFyoX31qzEotZ1kFYXJFBkJu
         ibJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774411; x=1780379211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iFik4hUuN6UNkV/R8eN+n1dH5ylNRH3jiARbcS/5Cc=;
        b=lttKLpGRBW3pCWGVjtcwDu5tdv8FHgf4sTL7zBrZWNuxbm881nSWwXW4MDtVZgyvn4
         r7KVNm13tOQ4xbLswpE0j0B1GU+AwXtqI9ookpm8ceX5FwvP2Xv0LM3eYGRnx0QsYPzf
         8HXXTq6Zw4tiGCHL+BBuHa3B/NEFyGPBjZU/Hf7ovjHPUMUwgZGtOgwDq/m1xPuAec3z
         eiOe+d2ofBf/uodpICWuiY9Z+zYYREaB2T6pK4XwmlA+7p31Gs2X2/N2YmWr0VappRS+
         x7lzF3MJytfDZFhv7QCt7/4guxZBSVWC8JJY+OabVQFQzdGrv4Dzr7XOXnENkG14kKQy
         4Twg==
X-Forwarded-Encrypted: i=1; AFNElJ/i+aWnZBAU1RG/7eGuhOy5NaMMvAotqWjAE6nz8segTG47re3Cl2RPvNT5K0rFja4letk679/82Mok@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/10CqYEuZE0VJL6BKG+5XkOykKlpgvCkBo0nDECa2yf2QYB6
	91IMDWk3aUlF5f0aBbJNBzeP62Ubw5lg8lOneyjHh0FztebRyYKjY3G/vfmHs07qH0KYJlRhWxN
	cPfS7YwcJXgkV4quAoSqPZQL2Z1ThBFPsVjA91RwfCyfA0WYMefn0V7QjOC9y6/W6Ud6KTbQ0+0
	cr6Q==
X-Gm-Gg: Acq92OFx0pOlf7ZitcvCBBRl8f/iHcUuYGyhksODCN5+fvsX0hMz6PxKMZmHjzMV1bv
	TTln8nJ6ZcBLDXM/yPrj2YPdd9Xr1VO4upGa1F55V+h2BWz283TeJHettZArwwLS95Pnz7xXRc2
	AMOUuSSKLlfJ1MSzG3/IQAfCUx0Knp9KT7Ej1E7OtaNT1J8N7nJNubpkAZQY0UaHOqR7IHZCrut
	4AP3bKTm6Ok5C/NQlIzXJ9SNnlgm4r7hefi6GVRz+4FIVFOyaMIBcZBUCEqEB0KvXGeivuuS94H
	aChDfIRpAfyR7T7LQXVekqWAI/SHrnlHzslcI1Jg/X5lIbVEdW+pRX0qdj5/Vt//K4pdAQ/36qw
	crqj6Obk9NxCXZnA2wcZrzhkm9OhrtRd0Sdc3w7TWkbwL5qkDB2yGbcFsOkByMsl19+ChjIqm1s
	KfTxqbvVAbhzIlZfZ9eUaxufN9R16w62hd6/U=
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id ada2fe7eead31-6a2b2ef1eecmr434410137.19.1779774411583;
        Mon, 25 May 2026 22:46:51 -0700 (PDT)
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id ada2fe7eead31-6a2b2ef1eecmr434394137.19.1779774411177;
        Mon, 25 May 2026 22:46:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462e1d86sm197558e87.32.2026.05.25.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:46:49 -0700 (PDT)
Date: Tue, 26 May 2026 08:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Message-ID: <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a1533cc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=52tii9ovPz_KmwLdHQYA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: lxCBTF2conVyJX_p2QNWcE9Dw-JIiUYV
X-Proofpoint-ORIG-GUID: lxCBTF2conVyJX_p2QNWcE9Dw-JIiUYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0OCBTYWx0ZWRfXwUWZhwVWMCO4
 Pv0Bdiz2aBvqSYFdEKI5usdAKGdQSPzvOyRUolsf1b6CMuRkPt+mpW5wsNcy/6O+MmpXECwQbH5
 n1YE8fD/cicIhWIf+/T5WfQM55Mxg0Rj83VsHljS2xFI5bwfYezF40rr5y5myV6BpG+IU5e7pPh
 deF/0c6xE5d+UaJG69Gy+8MIwm4mB9CxBRGIPr22+7e7CcYfUEoFCY7aU6Auhss0CBQ3eIiMba7
 ug/+ngeYjCYHXwuOYc9vwlqaHJBVT6sm5tOmCNJ5YtWhMlITSQ2tVaFaXnmdxNUT3SgN30x9C2F
 xF4dYU/QQ3j7i69Ra1E846eK1KHqVMrvqWwkfIX4LYs6Y8rhFdclEmxzmTETfRCftRpwKfl4S8i
 l7DC5XBIQGcNbOqxPRi0jPEl6axCbJfWPZ3mqi9IaNdI6qGqCod3mObaBYh+fF8BKlBxWzlkqLr
 EpbXECZICOVpAkKXXmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260048

On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
> registered as standalone GCC branch clocks.

, otherwise .... what?

> Drop these clocks from
> the GCC clock list and instead add their CBCR registers to the GCC
> critical clocks list to ensure they remain enabled during early boot.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry
