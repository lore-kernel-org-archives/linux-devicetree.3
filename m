Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830D42885E
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531057; cv=none; b=E/x7uyVbcyY4O2NP2N6cOXuXRnK1wo0VAuTt9P0I2hwOYeGz2mCvGaJYfUCD+tfMSuW8vHnNtVHffaQj4DKUbUecco2X/E+OMwD8Q/Q0C7eGL4u4kFCiMZ772y5nm1Bjl8XXq+irocAM9e0ojRzYtoM3g9GGo3eLaz4AyMZcz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531057; c=relaxed/simple;
	bh=H1vbsm+sOVsTnTKXHpuCSh0JcolkJp2LErhsArp4W3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3PgS+KPCdazQyXCWP//BHpxosgJfnBY9W8ittedY5UrwpuWzv7cYRF2/iNMfGawbJg3UwuO/gpFkLEFLnHC3DP1rv6+lZo5J2PhKQKdtxuoxWR7mhGYbsGjBP8wzbIiUMG+WqXLj5zbzK39bgYPALlDhyNVdKDzGUgrqghgnbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/F5jOCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMiqlEMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/F5jOCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMiqlEMJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fo6U3357758
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQbVCQOcYgrMSuBnKgBrK2YJ
	3K9nf1TQYgF92UBdgus=; b=o/F5jOCWzMjvLf0L6B6UjJI9CV7JlTTqr3HF5gng
	NSzTG4Y2tF5byONpRsb7dH1tnOWma07TNDS25WiBglwViqEdwqjjJYCz2HUd0OEZ
	6E1krrd57VQUFDwID8s4+VX1vQkycz7ngQNlZB9qTVwfSEp9OfDYQUUeF4dCTXW3
	DxS1Am68GoPL4+UG+/3cpxjbpKCPVhSMFLn3t9M+URWGoiqysYKdSboYa0jD9wV6
	XPFdmu1LjpuCfHs4HM0+scRWkOM7nNbyF5AkJF6qOpFm1sFuF0FD9P9ebVUORzC+
	rNiOXUV1V1hWyo6NlHvkbRhZi+v6g1AYwR4PTi5UmJXMSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1hdkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:37:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so10715091cf.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786531053; x=1787135853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQbVCQOcYgrMSuBnKgBrK2YJ3K9nf1TQYgF92UBdgus=;
        b=dMiqlEMJ376+J+9NWRa7hE1l04qzgddkQVCalyW6cBrkkYnK23JBBTmxCJRt73ZTK9
         0C5+SZeu5RS1tY/pWUzTq+iTMzoOpu+CHl1JoRBHKaHAKMDxYN1ZC047DVmwAvM2J5Vm
         WF9NpOmktTWHX13T4TedtqunyOJ6ZJFpHqurYXZHA8xoWK+gcIhuhrEHfkYbMtqoMeM1
         1+JZbFQsRm+FDaGcQG224PSgOA49QYwAeh3dlaeWhTuzODF4ceTi/GzkbWC/Pz3WW4Es
         AJ2k0NVL5oBRygBq+v/M1DL0jRulE33EblWI1ZtV8gwVid28DDumL5NidywgAN5t2tXA
         QxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531053; x=1787135853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQbVCQOcYgrMSuBnKgBrK2YJ3K9nf1TQYgF92UBdgus=;
        b=JFDL31XaoGjfD93RSdmrDD6zgU3A5z5FIikdx1JwOlKW2qLNqB01HoCJjVnnSZz0Yb
         zT4NJbXd8/ctG+Si1dYsVEv57SDFVb1Dd4HJp5aLb9+FAZm+qrEZUAtIJvnd/FvEW3xN
         axd0XVPb4IRc4LnGrIISOHLowhb370Hev0P//VD5dzgi5WzbRJusszHefqmV6nT4ZDyL
         c+MhraKfCgpjT0W1hwVFLXGVER/1/bEuYKtcmQp4/esQXHQVbfQQrDXrCzcnYr6N4BX+
         TiOw+EDEIaG0wx4o7OAdt08lZrPhi5hxRnJOFT8s38X41MUfAcSlx4nKR2NFwU1nYYaS
         63OQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpy4YlYgGPJLHvnmeppVLzL/puLQOvqn/A0ahD8hj/xMo+I109DZtaUVIL8Fzl8O9YKxQmz6AHQLqch@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBviwEsAB0IznrlrDL8nEc0lBh3KICkF5I3puqLN04lXHKWVu
	MNlBrL1HlL+E73xcKw/eNiaWrjE8TggWz8FgjHh6AEvFDoWX/8gQpQgqkf6LRPi/80g95f8wAGO
	cF5lpX5TYngcscAKpFnGiPQCMk3ltDAmlv/SP8k9YCEGtMerBFyJY03/iilW26YYc
X-Gm-Gg: AR+sD13j1JVJU0X790smu2AtJj4bL9teE2pcBW9n/JFl5cWegT/tzGYTIK/bsn5ZZr4
	2coBHUFpfvEKkUw1qtYRKQoy16Ad5fvZuzNxuPHzNi2vmf683utyQ0Vmuz3ndwQIP58QVgKK+wn
	6Cs3ncA/xeaIth4gf8vo0SdKxjcmDjFeAi9jbQXcfoFGeyLs34wL2nx3c3QbLJHrQn/r0dk30Kh
	W7ynvbwq/c1AEFnvrFVCD8pO3qtFtrHesvceFibCxI6y4+7+4DkHEMKaqm+WzwLqC4AVFTZgLoD
	JB8UU83AsXxaZGgn95A1m5GGaD9FV8ujjXnJu58Y+m91P7zIMo2ZuTav4FHiU4oIcFPlhpwGBSu
	FsJc5isYM/VLJOOs=
X-Received: by 2002:a05:622a:4189:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d6470814emr31453411cf.16.1786531053472;
        Wed, 12 Aug 2026 03:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4189:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d6470814emr31452941cf.16.1786531052930;
        Wed, 12 Aug 2026 03:37:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6345991f8f.34.2026.08.12.03.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:37:32 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:37:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Message-ID: <wxo7xxafymokwrkxra6l6umqiayrjdbmxb2sfqe7n2pi6mvm34@6tj64tveexum>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-5-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722142342.990384-5-mchunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yms56Tj0JIsXyYtuCKsUha3rA6Qtie4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfXxdyDn06l92LD
 GD4dc0aakIqETtbl0LeyM77ngk24dwCS05vAyvbX4v3fXf6pX0u/LBp0v/vOgTM2RFHUImpEf1M
 RfqQtoC2mkJ9wf3f94siTr18lXUN3MF2R571EFIjDVl8uRriu63sUnumMf5xQ+3uzhhyGLT/IxR
 2nIuKZbDjEL28EYXbsh4qkXlbyJICMzocC9czD9ZIKbfbiixoyz02K5X5Hq/q3x1aY6Sp4ifXFE
 8OFsc6yTeDvzPJoNZ0W1rmP43jzyYzpdA47TA2BQB/IeuUmeEZ46RjMdFP930OJbGxj2ttqcryG
 3FrLhdz6PFCFjZLrCqV4cLyORmg5tnL3Ec10kQk/WFYisxLQcKqJ/33ekBkTYWQ43Mg8k+7gWKJ
 EGDlFeAdCg1oL1xU75QxnNxwkmlRMYOLxmzMj4cHC2MHkhTxHomeG34hJ0ld50RrTUR0aK9cuoZ
 dzOSZR/P+Wxr07z+0Cg==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c4cee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yms56Tj0JIsXyYtuCKsUha3rA6Qtie4I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX2WFLwGGJBtmT
 jCqullQYW3HDNaSHlhGFhyBzqSkSqJwIkOkHO84lZXwZi6ep85/V9I61Qh18z+aDxvsG6T1rLQx
 hAV0Jjyc9H6GgdJGI/0ta+8g5yWYbcY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120085

On 26-07-22 19:53:42, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
