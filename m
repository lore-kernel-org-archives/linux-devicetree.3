Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE03401A0A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431133; cv=none; b=ZPDmaZ29jmLUZv0MJuMckXVCgyA5T9ZQCSs/dL+ONSppGAKiH3xCOoaI9CTVm/svGvad0RxFId+MZUZ5gZ3j6mEI2s0BAX/9knes5vjCiLBOGAwGK98KHVeax6S+2ROa6lPUzZszNDofnlfg/s4RQJfictCGckgy+LzamkhyG8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431133; c=relaxed/simple;
	bh=j8cTvjNnfSZmwz0eJZZJYxv6DG8sXpYymw5e7ysyM4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbhMrWhFNJRPT4lx9d/slOAc8yEORX/YRPxNCS+B5Fsbm2hj7r1g0oF9B//wJ8ETdtQeF1794pE13IpqK9i5EQswEgKsVArNIj3VgsXhyTlEFgksPMjncTiFe8eWsWnG0o0bIpMYbQPstxy7dzL9Uo6PSOwT0Lf3Y/1fcy+z2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m94rEqGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXz9rqb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m94rEqGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXz9rqb1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHARD212401
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 10:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr5ctLjXEDfEj66Ws0nGVXPs
	zhPrUrJDK2Jw66ZrASw=; b=m94rEqGGOwB0RGzLiPKJPGkleFcP8qvazkiyG5m0
	fhXBEBLYRCXdWiK2VCQcRfk3/16X78TkpCX58tRVeGgPzp02cfHx2AYHqUd55vSr
	Sg9wlO2lV7NR7GTM0tO3PfgoeCdKjWi1bk3zXOn8AXDZQxUH8Nl6Q4/gMp6+nM/p
	NgXwuow0NlfS6du0A+qXVff/MfS7fIpeVoDZxVZPiY2j9SmtWfq0Zne6Hk4cm6Z9
	jzkMPek1S+FH+YS9cvjF0uvNgt4GZVwPo7iVsL2DxqyUdh0Rf1XJSSYyrycY5iCq
	IU3VKZgXT40uM6Mj4QX/EztWJekbBl/lnoJ6MM6wZ3hgcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhe3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:25:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so416766085a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788431120; x=1789035920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr5ctLjXEDfEj66Ws0nGVXPszhPrUrJDK2Jw66ZrASw=;
        b=PXz9rqb1pOgEUphFGylKjexrD4ewNpFbVwISWiR5UC1hl4jYzH1zAhMeI2t+jhQ6Vy
         ZsD5xPDqde9aWh7LBzgqp+1xq95NYIz8zci3gfel6bjd5GcTgyxI7dsyP7OShJPomSwV
         AgnU8GEZ0oG4+8ROpNTRMPOQFaiex395z8BAOVAktOtXOF9TbTex3gA47Sqsl6bLvn3V
         w6zQyBujwvVwAGeHV2FkALbiFuF8uTzwXtjr5o1gbyrxo5MmJr1KXQ4B4AMAfbwgyTcS
         afehhacgDLfzBBkoZ1OwtEOfGbf8T+0KcAv3gAlNKX9s2S0YmqCprOSpCSU9nVmAieCk
         Ip/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431120; x=1789035920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr5ctLjXEDfEj66Ws0nGVXPszhPrUrJDK2Jw66ZrASw=;
        b=OOFOAq9s8JD4kedhJDvnhfbDj0U9JTQA8e8ha+CQUF95M1ilDGRSJxBaAU8D6s3fCR
         +Gwe/ITy8X6N1x0IC+2uNvARmiPMfN06telLWBN4sz24BBjWAjzfssw8suejj47YqQjo
         Ge/+pQ1c1Gqn5ba/2FhzTgBFVZh1kmDKCg+fZpy4Umfy4R5OH5yo2YwxKI1MKikl5FVl
         tEym6iCj3vavWVeMzR61H1yYDFkmo5obkdyGotNfR+ltdGixanSDHoaa6S7Tu0BqvSQV
         iqo4epQWv1J6thLP2X3tXQ5CtV3txu4zjx8dnF5FLlLN3zD9f/FV/tJ3RdZmg+ItIaju
         ZeDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtaYD1VbDbdiI6WAcYCfTGBP3XtxcCXupasnc9jjFnkgqnUjTMzPSDnmW/3ZXDFdmGocWr7ju72p7z@vger.kernel.org
X-Gm-Message-State: AFuF++mjR+1w7NwP2aHKp0Jt6YQWTS/keshtXeiXri1CVHA1otBi7ThW
	dWq9FL3xUrMxXi06XlQBM3QAx7W/3SxQJYyWAD/TbiQUxTFt/oAxUJDLywwQCJimGMmayzqy+5B
	LG6c8rR3UzceblxdI+AwxjLzJ76t0JFUXgJoFG9AZYiSq3IWaZl10R7vJgM4ilc8m
X-Gm-Gg: AYBFou166h/VZ7PdrtzyGcuAuPVlOOAkxUQFoky/PjB/SEZfKy43zJhVGqI2v3wHTxy
	UMn7dkbQSw3OfEJrJPqp2I0T1ZvrSk6pZqmpLZ2SAABqk4GH6+F4QX+Ct7hfkE5qLu1xShRMsRi
	JthLYNgTvARRlzXHn8vR++T1MB40yjVYxq3CRpZwBgKsx/sEp9jy+rRDoQ+62n/M2y6afjk8cuM
	nyCEKNPsJFMiHFRmcF4UZ5iZl5Gb4uswjj7LxPTC3/wFiBYboygRI2OiyxQVH+/9mAiDUauJ669
	4crEQXpx/IBe4zOUUSSkmbKXs813nT3tf/C2QRGC8Z7nxsMVSmlxo/WobSGVO8HEvsl8Uu9/YAK
	g7ZdUWO01XUbTGw==
X-Received: by 2002:a05:620a:84ca:b0:938:39e7:725 with SMTP id af79cd13be357-93960f52971mr1372667485a.32.1788431119863;
        Thu, 03 Sep 2026 03:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:938:39e7:725 with SMTP id af79cd13be357-93960f52971mr1372657085a.32.1788431118976;
        Thu, 03 Sep 2026 03:25:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm12963975f8f.37.2026.09.03.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:25:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:25:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY
 configuration
Message-ID: <z5rdzvlvzwteyh63k4mpkwyryug73vj7trjc5lbzutg3qznrzm@6zbklcre3jup>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
 <20260901-phy-v2-3-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-phy-v2-3-cc93d2f3b1bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX1HchhQzIu8kl
 I1B8pSgwUly2dWnim+GTJQjVzJAakuzJI6lmuWVehs3PjXuO25/Bcqpj1vk3YOEkTtlNoDlvnSz
 IztqgjDSL6Bd574R0iX85wFjukYhMcQ7nXuEnKNVPp70SfOB0QMJ6lsaUQYwTzsqB2rHpfwAaRg
 OfT+jmJqZLqlNfuVKDHq1KlOR+/S9asxs8095jq975CphpgqJojioEdmH5kTRkSl2jtqArjSssZ
 7Hg3NOgk64eX+VWojW5M6xMkFKIcbGnClZ3wn8XzvufLvzBOCktYxweGy71/f/miTS3XP79Smj/
 Nh7VcT0akNgwagra8iptSaNb29DR1qUuo8J1ZVn/Fv28wWJiEBHGfqtZ4HQOSzP6rCrwcPYU+j2
 0ddQAcRgLXcBe9zUlsuuzhV5Nio9JzX3nRkcB0KlCsX2HNvAlSJHVA6G9bcJyXrlzRyiPxWlrld
 mrWUnnW//M2Hs1GQiaw==
X-Proofpoint-ORIG-GUID: N5Pi-0pmlwSBvzY001qmL-FpEGEa9v4p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX78v6Ktpz+nOh
 9L4DVUQo4x3lZ1hfzwOwJ+Wb9c/Ec4IeeuaNmrMKQ0D1bQIPGS+wK0Vhxc/qz2UCpehnyj27muT
 dfJ+fEfNBqOFw9tcAdaenejZ1da8GKE=
X-Proofpoint-GUID: N5Pi-0pmlwSBvzY001qmL-FpEGEa9v4p
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a994b10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7dPHXdr4Qe62-7ilc7QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089

On 26-09-01 11:34:21, Varadarajan Narayanan wrote:
> Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
> init tables and compatible data.
> 
> IPQ9650 uses settings that do not match any existing supported SoC, so add
> a dedicated configuration to allow the driver to support it.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
