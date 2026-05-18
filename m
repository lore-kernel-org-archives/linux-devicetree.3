Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46793E834F
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100152; cv=none; b=i/YcNcO9H6OcYB/L4ikJ+yySV9f9qv3wtsqAq5XTVn9k+HhQuCwueIq+2j8ser45UGLDpw0KBHGGPnIMU0dOmvpTOMpDZS5PVH/iBaIMBkcIW0bIez1QN8HbwhWu5l1ScqEfeQtq+foWi9c6Byh9zM7Uc1x4nVu+9cnSKeAyypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100152; c=relaxed/simple;
	bh=LeXd41lZboq50qnzCjlZvrbX1RF93TDpY63Fs+E31Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLbwiV0Urxv/T8W15tUu+Ks3oXpzq73fXOw7v4dVF1F9KhcWzB1qykWKtnVkUAh+hi/PV2tImDFUvNRSObmwKpGapaT3E4/0h8t7eh0WTHxwZhgk94bmz820URERYLPMAw3LM6h/FJtqrvaC5/zDftUIUNW6h/DuBtMlwQXLc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyqvYYqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZqjo5yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyqvYYqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZqjo5yU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7BrpS1564165
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iDIDgCmo1MFgZ5mlJSK1d4nK
	X6DmCBRe6ltwAExOghA=; b=QyqvYYqr1C15HhRFWXI+D6/URTHlG0bg6mX9u3Ju
	H1xdstbYVayNLvtbG/Wnp+LneRq2Qpa+w4feg6pTWUS6FFbr3i8wVB7zVCbji83e
	WmBkvVaEJYwzgw3t4mOyNo4tmw21XWMHTJcTwd8vtkiCQOM8ci6bKQCPQ7aQpTgO
	8eqON7IjuhEV+NLoZ5LfCuojifSUUJoB/pe7/MEsCVWK2HIVFHcM2sTPAs2/gC9k
	MEzJKh+/fUDblDigqzg1jBc9HecfSOJs7PjKThr5nTJXp/aDIiJd1UkX7AGBaTWE
	kBk5CvXfQvc8RzwmvyUky+IYHRHMSChuj9V+S7B01f8sYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqx1pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:29:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51605cf3c60so26745091cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100142; x=1779704942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDIDgCmo1MFgZ5mlJSK1d4nKX6DmCBRe6ltwAExOghA=;
        b=cZqjo5yUc16FGcte2IvWu4RibpVgQqIcr1GN+Fe1XfNU0rIBj+/ezE+y6N2OhdWja2
         koPVtZn0gYqSwqKyhv17BSENPn8IA55/Y/J6Nw+Y2yp5rAqYtOqZMhrE0J9uHVetqRl1
         85M3PBDoj2EKBl2WLw2Yh1BKhCHesxydw8LWx2Dl+gG6O47Wmpkk4WGWyFx9lnynRrUq
         //UMI3iUAxsEJhh7njPCTcIsmSkCrkf/39y+No9/GpZIeySlhje8FDrhX2GvdyWSZL9p
         QQosdXAXxzLoxU4tZQys6bGEta/mDp9ztKcXHePKEvYuqjTbd8ThuDeG9rSntyrUjYd+
         3ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100142; x=1779704942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDIDgCmo1MFgZ5mlJSK1d4nKX6DmCBRe6ltwAExOghA=;
        b=HcKRFtsbOb69NGZLd9hI20L/zXReDrpdoMPuAQd++nh2o3+1nmPz3rz8Te1nP7IG7l
         rOW/MxvDZ7v0zgx8Pzp+WWNddlnw64ws7hL/sFbgJq6qCucosMuJ+CWkGReJUFVQMXOo
         1tXlS9wf2yDaMIZ9VWRfY7H/lvkxk4xTDKapc+lU7Id73A8ozqlFhkQB5NoBU4dM4HVh
         3S2Hnv1eBhHe32aUP4NoVorbpDi18Np96EYyAxj5PnGvkeKZbDxzT8D/MH6pLJrPwf6V
         cZGXg1JHVdxsSh3HzpBi2AqiWC9gXFdmfJDY+Rq0/b2em6z88LQcAWd+bK+iyyUJTNE1
         qmEg==
X-Forwarded-Encrypted: i=1; AFNElJ/CTskt1+yQmpuVBkJlfG1r8lO/lUTn1jcLd0o7l/T9jf4tLv7qeq5MaDFL/fKzxTTbKClJNFHK71ld@vger.kernel.org
X-Gm-Message-State: AOJu0Yyar7M15IUSeWy1nyAy+wUjGpaJIurHby42TuhrN6rM7cQTb22U
	Uphbj9Oybcat1k4PmZfQTl9oYh0UUzKGhhgzEg3w4rfblx4HqE3v6Q4R48PDHeqGtiwdJLjdJoY
	dR414wXQvAqCadT+lIJFhzxRM68qTpGsNj/MCTLrM7M5f4OtTR8WDrBj1+krwiKtuOMBXQDxH
X-Gm-Gg: Acq92OGMoXx0ZfmFO6oYTKXqnK+UTazddH5nOhjm8bAG5d+h2fvxLoruRN84lgXWtAM
	kbA/rhHQj5VIF4EHGyPg8qu0JKA8uMQL8ErHtYf+M+xhYG1K/bNt7iaKwlfjDE/RI5bGVNr09jW
	veieSXTB+n0de0GMSs1LX4Bz00du53j6BtMYCfoSMVpJjdU8iflQgTQ7baFo55Va+3Fn6QgR67T
	K4m7PuDQp3FxNZIxVTXt+KRyCvdNa6tOn4+nf3YFmpG8Ed7eLbYcZ8Od5cXeOSK5NKduPY3pgFw
	Lp3kA52sDQ3yAhaStpPp2b+kazzCI+cL5N8TDXaZ44TWRW6ltBf92XIO3FAGQdAztSMnCDJlbj9
	auDVzvxWVr99/QbZ1BfbaiohuOA56hVRmuyE=
X-Received: by 2002:a05:622a:5513:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5165a256f60mr202989431cf.58.1779100142083;
        Mon, 18 May 2026 03:29:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5513:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5165a256f60mr202989261cf.58.1779100141504;
        Mon, 18 May 2026 03:29:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35618279f8f.5.2026.05.18.03.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:29:00 -0700 (PDT)
Date: Mon, 18 May 2026 13:28:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
Message-ID: <vvqddmzhrcqgn7i2g2npfrcccbb5bxnhj7okvjli7u2n4onrz2@jxsqz3tycf3l>
References: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
X-Proofpoint-GUID: JhL96FwqlrK92d6uMgTdf0mSyZ5F63F2
X-Proofpoint-ORIG-GUID: JhL96FwqlrK92d6uMgTdf0mSyZ5F63F2
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ae9ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ctQbN4LTtlHq6RIfZ_AA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfXwZnhQzKWl/Tw
 MOZRtgvuDs8ABf3ooUyTGV0ANaIPHCEjUrnaNvTn/c7iJoRjDbK64EheCo3wL9pnvAx5/ekQFjh
 7P1Pixx2z1uZxVymEjvQNtzvnMBurNwAdQu/ZMg4tP7lxrfBA+LJxQcWeg2StTRkLoGR01VyB+d
 bn3OA9eZKcWL0zKNZ+MIrS+sQ3OJI9AYuVRPY6QpxVTrFjQv8sw8pJaAOSYTY93o7SMIilvvNei
 3NpknpwKHyKwyraqZk2npwBBKL7HeL3dZzHhkomXzgjeK3iRALo6IX3l4LWAy3yaM00fvdQ8P0j
 O5Xai1PRsOH2kvJtlFzqrolgCYHg0xvjJaLoEYbez5akByZ4sBRC9+jv26RjJtaTzd/V04lFvh0
 RG5WVPZWGMYQBFOtdllLVHNdOC3/HQsaU+JKDuD5A8GuaycO3ZM2TuJ7EDzlc+a9GKUWzma0qrK
 WazdOCwwevRQtbsELWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180101

On 26-05-18 11:54:39, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The tertiary controller's HSPHY has its own toggle in TCSR, while the
> primary one is wired directly to the XO clock. Fix that.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
