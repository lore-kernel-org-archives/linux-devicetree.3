Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB63C278E
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284573; cv=none; b=O87HKMDlQplQv3TVoawZRh6L6FUaM7iW0SNkwy2aA6DVoy7WOSUwmJnLhBpMp3Ld56aZwBaZxutfpxu6dgTnqKx2F+ykycXxF04cRidahX1mA+IiY5VY3EBnXitu+7YWVeDH5wp6Ph6faomv/Nv4355PN3cTacsk3TrTbE/stNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284573; c=relaxed/simple;
	bh=NuBkrkdYP6aIzqIIwzzf++Peu7Nh8IzTYGh8tDvy7O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4Bar0Yl7k/qyg9WuN++npSgJP7rucpHc/y5FwRB6O2+cuCQ4yVe3SAhyanr69jZL91FCKPZRudSgqn3pBcRQIJEhXJ1RSAi6T0Bqw1xgEBysvPGzLSumiGomssA3zYCqpHcN5Jq7zZUOEdLB3n7rCUSFOtgJT1YiNLwDD7jyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfsqu911; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O92TwV0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfsqu911";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O92TwV0q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGSDT2626400
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hcVG9wh/UlS+hAvldkdDQoBy
	r7nYBq2QcZ7eFGLq2jA=; b=Xfsqu911HY5HAPQAqHGovqkENk+pRiZSxTtFlHLC
	w3OulDimcRAaMqMKpKF80tZ9K7zNM0vcRw8y1mZPcsRwWFQGpiBP65KHCahtqaSN
	zQx21k+EJj/JkdzkL0GJvUzWYwPUs/vKnWhgziq3FYYjRxl8V6FdsBPpvBPAKTSu
	fJFbIR4Bdev5NkqoabhxlWonT59fS7h2mOa/I2hgrsXVt7Ifh2qMnRr3YiA6Epdq
	Pd81buVyQk80VBGEU5IJNLeBfFCW/ZObkGuu/g5BhA9MKADLb1GtI2sGYi8RwURL
	1TF1P7XRW69tR/pH5mxncg6XmYyY+pN1RtlgcJd/1PIu2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1wm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:49:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso31602241cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774284570; x=1774889370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcVG9wh/UlS+hAvldkdDQoByr7nYBq2QcZ7eFGLq2jA=;
        b=O92TwV0qC1g/Qeu2tCxc/eufYJJO09uGemzL/EUiTU/QL+Lk+tl07O8y6vmwZ/tpne
         /Sse4Gula2AgIUCE0uRxeDeBmtm49iwLN6ZW9A3KU4oB44nxVDyoNEdPIi0PS2inWuM7
         QJmf5Kb44o84EmM0a9pzEHL2PgoJT3a9bRepGHjeuuDyBiIVQrCx1T2EIwO8LXsbZYUo
         KRbobK5XwL2JbqbC8dAG/htKvPVmowJMo2rI3PbXoBoSlUU0C0cxfv9XGh41f2kGl+rZ
         Y/KyXWETrlB5KziiMRYw68pWAQGiM51rQXtfCD05DjCyD/Ji8DYczIQmPZhlz0w6UKAi
         xcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284570; x=1774889370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcVG9wh/UlS+hAvldkdDQoByr7nYBq2QcZ7eFGLq2jA=;
        b=WmNA15+dDQYyVv80SseEN9vOICk0JvSQ40yT8IctrSaNUxF2mgXVRQuqkF/fFklOKW
         +roMOZ4cz+tM73OtOJ9VCf1KCjOQTByYCYiObzIeVynSLcx0377EgtOfhmhxoKMhsegl
         CuY0JnS1o6n7IQKZyYJqL4Rsy2EmE/0W3TNVDKTV56CPOccatOvYTmjhkYd5UQPC8y56
         VXHYS9vq6FXDPLKAT7AHWa5+O2c4Rm5dsu0vmNPQF0dV2Hdzh/R+zOCw6fqEEADNjHpP
         N5ln1z7CZZjVcYILzE0TR2SrAW7yOVDAFy2HU+Q/XkkWsaYLO3flJcFuF7+sRxzAX5Qv
         KEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAhB5Lmwbxq4dxQXP6aBT2oL8d0qKOQFaXrE/7ZFy+eBLqY6iwSkKdEmreDlJltfPnQvyWZEPOQ2U9@vger.kernel.org
X-Gm-Message-State: AOJu0YytdMQDbzDziH64ueQSYd08w9jI1NetRQY4FKKvD9fPH+zHsYP2
	Z8FjOWEwguGEb0nl4v37cC/0DULP+tZlPBLuKN983lnM9LSo1bkDR4ZT21QUknjGwLcAlYtRA/Q
	e9+vK1OYYQMWd21FO7ZBIpMsYZ+KLJizMuhdAmEQPa9EVT3Tixyu9OeT74LX0ZclT
X-Gm-Gg: ATEYQzy4zi+wZ2Aq3dlSou7aiTbrabDYktzZ8r0K+C6VUbgIz+gjWnArpIn7lyYURuZ
	cQwAeJaqQWSGxp9c8Zm/D1o9ilmCx1wGBDLjtGaUtxOrTtyUFhaOPb3Mwm7bFLRTScBYo96jk64
	Z2pN594LDdehy6I+mTY3RxQ+GgVGOcCjsohSePrMZGc/Ey4O/bDMPgZVbwZNu/Ig7eUCQeBR6Mi
	/3LWu66kCH+Q48Y2q0ibjJa4Al22MdXtdFWgnhs+sbG+n9CluC/+oD/RpdiCP4VLdtXhs8IT4Wi
	f3LA2Ns2bBkLmSLQfsGn+fQcNuCE7GLOyw3bkZMTMA/FcVYDiScNMcxSeZqtqYJGhuMPcGTAhpB
	SYACUxyOVRE7BPHVECjueUEK3seTeA3l/wVztCbsW5zEnHaMlV5SKDfC0AtMss8R0vC4eySk16s
	bGDCEdnjcWKixzPPRLgmY9rRoYYZPsXhS/KuI=
X-Received: by 2002:a05:622a:8e15:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50b374f5c91mr186754941cf.37.1774284570065;
        Mon, 23 Mar 2026 09:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8e15:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50b374f5c91mr186754471cf.37.1774284569630;
        Mon, 23 Mar 2026 09:49:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf998202csm29405111fa.26.2026.03.23.09.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:49:27 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:49:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c16f1b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BtDBCqDdFlqQZUnCIJYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MP1LAfgixx8SmVAmAxb_-s-F1UFCIXfc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNSBTYWx0ZWRfXxCaaUZR7HnAb
 bm6Inl+O//oDHfDbbNx/yk8nMjl1QwNMAhKyqxUMLfYLry+xY0fJurcYr0S7YmzEUFi2KuYtRox
 czDNqUeUA/pFiOozdIDULHO4g4nV4DlrNClVTPvHJDMeeu5dy/UplNErxJGDryaYu/fH2XkwSF1
 Dv5K+fY3RXbsL6UlLzA7o4h9yGjKHSNqTexFqiEjNQ2KByrm5nsKIOjHeP94ZhGw/hm492Kp8tE
 rijR4ooBMVhP6Bt3klp67RW5PEZfwcwJqwdOanxwzbri+fCtXJeVizEiNHC3K8vgzvfExDocyUJ
 gN5Jcig8zDmB9vw0lHW4DBLu7ogJKM5DmprJtEqmTFfhXyQvQZhiZinq2pPeaEEMt1hQC9QsTML
 hNrum/ATyzI+byAsq4hDBC8EwOpAqPZ7vFgNHc1KyfbWfRm/gBQRs+wlr8D4Q+yzktldhnRnKdH
 ZYl9t/tvVwVBQv3w8tg==
X-Proofpoint-ORIG-GUID: MP1LAfgixx8SmVAmAxb_-s-F1UFCIXfc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230125

On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> > Hamoa and Purwa have pretty close thermal zones definitions. The major
> > difference is that several zones are absent (because of the lack of the
> > CPU cluster) and several zones use tsens2 instead of tsens3.
> > 
> > Instead of completely duplicating thermal zones for Purwa, reuse themal
> > zones from Hamoa, patching them where required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Slightly reluctantly:

Why? I'd really interested here.

-- 
With best wishes
Dmitry
