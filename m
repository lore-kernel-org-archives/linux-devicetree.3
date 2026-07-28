Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600613A9015
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231112; cv=none; b=Eylv0rzFehHXuA3K17fV5SnjX+hdw0zTFK3LQDpHMXb8wVQ3VdXnxlu+iPY6yfttR8A+k+xqqcYPCsoZ6hZRBHDoEEfDoDSy54UCz+DyGnuPMR3i28nF100ZaP8u3TkEi9HmyOIsfIMSbyeFHKJxAf70e1ZScC8cBhl6sov/G7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231112; c=relaxed/simple;
	bh=/obxe1Vb7NFTaioTc0WNXa5Lkv4qFvuJ2105wMCse8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyE5UwO5ZnbEMErEF1bNid/mep4LujwU6o8AwhK6l7WS2pTDDXmZBDz2GRHEV0C58gZsIvlhKTCgUlgdOKtVzZlPag0QqHv6upWnIbvfhCd0E+RgMA1/m0iNKzfrgx/qyKzigq/cPAzI3wOlxPYN+1BEW89T+uA8mvVJJUwlIVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XB2gS5sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwTjZj7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XB2gS5sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwTjZj7n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82qjS2309848
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1Z67kqGGzp/351X1MKH582E
	OuE2QOqRdpP9R/VwDZc=; b=XB2gS5sTrNvwZxI4lCixwjKTHncOUw14DfqU7qpt
	JbrWatVN3FPNOLbquOjVSPIy5WZTtW6NeOHVopjOtMU9r6heI/SIQ5Ld4fZUgtYx
	NWy/L1yeGp/hinJejoW6KaIGqBl7pcJI4FnnX1unmRn/RuL95r+zuakGnkkF5Pom
	dZGvsdUoAqCJGBdT5aa2d/Hgq9Hd4p9jfeZRynzG/w5FkwYRyRuGHPVAQRY/qxAt
	nf8L7kPXHoM3ZEo+ItlaPerdrOzKTxzOFGjnMtV7F5+rRzT8AkwB6oRrgNtZn4wG
	J4QhFJYOnPuvurdxCZuMP9bsK9/Crg0NxSt7vPhoQLFiAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j1bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:31:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so79959215ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231109; x=1785835909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1Z67kqGGzp/351X1MKH582EOuE2QOqRdpP9R/VwDZc=;
        b=bwTjZj7nU1Mh45XMyQfovOhT6ey+a0Q+J90ifjFpi2iNtUtvHD4avOG5wLx9RClR4M
         Id0/Cke1vH0MzYv+IlN04V5OUWKNYGyQ0roTz1yCXvxILjJmd2y322dWdBXBwIGrbxHV
         4DrpWyiWTBDZKOUrV7/dav6CLEoJRHgBpht8zfB5axkCyDqUaYyKYzRPlX3Dhp/TyfxN
         FC9xv8DdGH4C2yISnIO55KuC53lqxN+LLj/ZfcTfmQX5ivSoju+kCxDXr+URRYrMPVJ6
         OH4gaqrjzrqAsaxRpXE+mEo3pqv6gH56FcuKKOTVjkcSz6bqa/KP5L+UevZ/hQnxvXm3
         sq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231109; x=1785835909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1Z67kqGGzp/351X1MKH582EOuE2QOqRdpP9R/VwDZc=;
        b=LeRQjm7ed4TytJ7ccyfykmg90sgOdtNjkKcMM8lMXsJ9lR03Ie0jjcH1AIlPMhW7LK
         Idal2ejlKRBiPnJQb4Ob8IyMwwQyoj5c1ZCjEOJFwe1Dmr2e+e5Z1jk4h571C3CO+uQa
         WhrfVcMAOlPl/v+ybyoH/WnmzSEJiSbnoUudpsURArw6mjEH12/gdp3pJcIYkFRd0QBL
         ty2DqyknEPZhzxnkPX3GskaJgZ6G0Ky2ihIs5K2Dg0bn/o6ej5ktwpi3C8UvzDo4N07M
         JVL+uCPzAmj3yAz1Y3v/yPpKsqm5pKX0Od+35+I+ObCoKgQHJSat92K9pOAF+xVTBFaV
         ilbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIX51OXpctNRTsk7A165c4TRaUnIoO98e5I9Q2y5JHKb5KT5GbD/+pOI8jpks0pgiaodfeuU2d7Hy0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NOQFGk9weOomC+nSRq3uVWHj99fGi6o0B//0omzAZ3XrBaiP
	b7YGT+98puTs3J5dpbwb8g+0x05imMkhPgdWNt4MU7O+lEz8OV/iy/tUeRPrCktrVYcNia/FLOv
	NWWIusVy05cAozHRQXouS2rkJv5/DZSzotJAbEsxrgOqRjxHF5FLsR8tT6LL16Pwz
X-Gm-Gg: AR+sD11roq8KhXbXGSrvsUwczTkO5OnExiwAjV1lkxvkuXhN3kvOQCbDQzqQhuIatDo
	N5erSpg/YGfsa3/KuQzMUtJnt4n588O0G4BRLRkC2lL54+zWUHl3gh0Kr9bTCUB2QjVJnHl816T
	My2edW+fdalflTzwZNdn1ewu5gKrr7cZm95BxWqhNRdDuu+rs6YvC5/KbwfAoUGa7kNkQl05IDC
	GGmwHH4Y0y3RbpsiM5vg0POveeBqdPpUdq5eGuBOboG7bKaFtzeHiG/XUWLx/hv21Cpim/mJ8If
	2PCng4hcUom13f3/Y+ESjRdahsIXckRKn9871F4o4r6wpFu6dtLFHDsZbAQhTYktYOzzNSeGg/S
	fSjn5/Bx0B2J4UaT69P3xhvDAc/DcQLm2Gc2KzKTUWy4=
X-Received: by 2002:a17:903:390c:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d015db9a6cmr18856805ad.42.1785231109204;
        Tue, 28 Jul 2026 02:31:49 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d015db9a6cmr18856465ad.42.1785231108765;
        Tue, 28 Jul 2026 02:31:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm48841915ad.39.2026.07.28.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:31:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <amh2_i8Z-_gn6tdB@QCOM-aGQu4IUr3Y>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
 <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX7irF3IPkp3m3
 RrQvewMzRdhWXz8QtSZ7qp6/k/kqw4ba6XGh87V9RRpLS4VDQ+Sx8FhncOnEEEUNsnX8TnH83v6
 LwxQFHIl7gvIvvvnTdkm55vOVGMaFG5zhK0rwrWzNlhQcLMRzY+RnnAbQIxzYSAL42oCN/WLowr
 9r/5dE5DIKAhTQWrHl/Y5RfxZ6pDzRsStcIdP7EiUTOd4+Pydvb7P8CSvTDq+NjOnRelng7g7ma
 rQbuumZrVbT8vJJoB0Tr166UcU936gA4Qofe6/1RvLW//Rl5zAB8m44fZBDFCoW92GrBG18pazQ
 qOSUIidu09Dzjg1Br8JMaGOtpnYXr/+2tiYmLbn8Xz11HbGg34Ox62hTKyg9b6/o2E/JrhrrGHm
 AtTh/EsfLMUNiP3eSGluuk8d17IdAZQbJ4hG5NBF8f+cBUllpbq5Ply83Qk2J4mVzXdYh5sjDpD
 0XW45Ni/xnJobKH+FVA==
X-Proofpoint-ORIG-GUID: tmMDNNOmkaUBxiSe8VrECm-erufyHkdA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX0oy5eho/2bd/
 2saPs7X+nosmZK8dlF7ZtIh5WwHUD3RV8dHEmWPsNsfBYG0veAX4v3tiU+S2cgJFKEjQJRXt+3a
 RS26vGim5B+2duS5XPxmRZUemWgh/Tw=
X-Proofpoint-GUID: tmMDNNOmkaUBxiSe8VrECm-erufyHkdA
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a687706 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j4koS-U5rW7OSw6DyBUA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On Tue, Jul 28, 2026 at 11:19:56AM +0200, Konrad Dybcio wrote:
> On 7/28/26 10:40 AM, Shawn Guo wrote:
> > Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> > is pre-booted by XBL before Linux starts, so set early_boot flag for
> > attach path rather than a cold boot sequence.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> > +static const struct qcom_pas_data nord_adsp_resource = {
> > +	.crash_reason_smem = 423,
> > +	.firmware_name = "adsp.mdt",
> 
> Please use .mbn everywhere

Ah, something copied over. Will update.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Thank you, Konrad!

Shawn
