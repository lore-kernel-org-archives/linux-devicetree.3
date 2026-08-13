Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C000494A04
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637740; cv=none; b=GFAbjyiWzkxsqmd9zwtShpOQyQZRCjSfltTWteLJFmfcHPpxM1MrZfC+avYP6JXFHBJF/0nVtUrOPNfS8eFGVt7IusPOucVnvAXjwTz2D4RGMYOBbCDQg5Smu1JUfQbCYK5Ab1C0ciJc2fwK1RSD6ej/DLHc2sEjBOhUAbdJn2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637740; c=relaxed/simple;
	bh=MIvrKutPPH2tVhwKPLjG5U5q/+Ok6qTd8pvUzYzU5ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeNd5ITrhf9Z6LG4JWUrB/GSK2WBPVosIm77g8p39yGl9p1tJmMcymae38nCc8cHOfV7+EDmOrDTLc5KCWnfEucZ8MA+VIXAGQy6/RtMxNZKnH0Ii/BK5RayTn8k+EJ0ZeZ/NOTU5js3fbeicdwhQk0fhRlOBFIwJcuZ0GuUHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+09M2iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMacfKcM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+09M2iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMacfKcM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU7Dx2375829
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6e+LaW3yul46PnnkTF3KFrhY
	9wadBG1CabWIFspdcCI=; b=b+09M2iwW9KlmqorbV6w5LXAOnncoC7Vz930iiaw
	xcqEucJlhL335OPjnX1dx5mbiQcD2r9jL1vwCZY5YwX7R/GAq0ITyzLXCwI533y9
	CRY6Uwbd7C+4rbXG7tt81eF9v5hi1alCALyGsi5FkQMd22dURg3jjJlqSsAwEHUk
	ttAF/xyhMDnyjRlx5O/77b4BHpkRVKPYVLsV2CBFTgKHX025DO8c6FXAIHhWsD1o
	b0ftuptILIjcpiwqEs5wGdaVsMPmUQvx2lZw4nuRLdPGZ4aP1Ly4O1qvAPcELPh3
	AgVryZJhYCbTlF5mpXfrTRdaWSXNQynGd+SbaTMCHpsQWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14sykct7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:15:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so1410881cf.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786637732; x=1787242532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6e+LaW3yul46PnnkTF3KFrhY9wadBG1CabWIFspdcCI=;
        b=OMacfKcMW4q1qS2WRW0/SlZ2pHWV5TV9iB6TJZvC0RHTUZ03uIIcaLezdWMqQuxJ0Y
         ecfSI0xFUx8fnlDg1Hknh0BBbk19DgEm1uvmtjIN70JNv6CZmlH1RIqE/gg75zHJBhis
         doR8d9IAp87cupGjNmB6SXver8xLAGpL418iaNS0SMlubRjYvpyX1bt3OK2UvNfr9vCn
         TItSi1BZjPAGBw2MYMqbDvOlz0Cp/9i8kaX/Pfmr1YGF2IVFKY5S3b/engXzr3oM+95/
         o4/mciCY6XEfCJZlYylzfZjG0nE+RqzuNTiTcLeyRnzBvQ68CwlqavIPvXdM6QuIVqZj
         Pq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637732; x=1787242532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6e+LaW3yul46PnnkTF3KFrhY9wadBG1CabWIFspdcCI=;
        b=ZqeYSI/7AEZ8zGP+KUHgVCgX5PavqPMPVsfHB/i3tlnMU9+5t03uhDFa0e+I8sw8B2
         /KxKVBGmDkU53FExdLKZXk71ehq3nsXs+tiPL+XLFddMfLMSVZRGDJdzYFaip00nnpEU
         6twVXB8cO4zahbvaQnoJdMJoXuQvozzM3Xshu3UHMx1PKCRia2rA1H/+rC4KHm0kyMZb
         4cwPdUn5JY01qBd3HGM3YwwCujgFwOQYVIcL2/yp5vTmwQL2vRS5jFOt9MWWO0yMKOgT
         XaaZqCovDa/LIc44x7be9C2/KqkGvjaMAFmHccM6rhFylYZ2XHhvY6BmbFhF+xUVW+US
         g5ew==
X-Forwarded-Encrypted: i=1; AHgh+RoGkn1GsHMBqas/9w084iEgFvh7YHIBa0cbClfHXtLrB07zh3Kd3+vaTWnjxB6hBccn+Nr00j+/yuUM@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8EvKpC3jISEdURMk/7ebcsAONZiHBbga62MSvdcg1mg3P1qm
	fkiTONmVcme+2h4NREA2lACX69/fCCrtLcWo5pI4UbcasD+LKhaXlzyco+jyzkgk6iElYTPAbeU
	BtCghCVa/obtt1j/h5cHmg08kxK8FbJS2zv1mciuvhtE1ftXzOKYTKqtKaxqWbwEo
X-Gm-Gg: AR+sD13EvVY/YJxexfNIDM3n+fEHO6jxCh2a+4kI8bFIwbeJkubvQTICMb/18I3HAz9
	IxkP77lwc0pfJdjEwlE+djlICfGuawaGeo5koPCx32T0RIqP8lio4/154ZecAK0z93NZ8U4fS+4
	2xepgsviGF0AKcWFxIR/n6wrGwMyvhjdXpiKrSPqxC/rK37UYIPj6qyMCEdZiZzhgHcAZButFVw
	UKi8VsLSVg73MHfOWAeiG57XDZa5qLJpoS9w4N/3CJu9w1GQQMmLYZV+Dk4zI0oyteK1QAXmEuY
	mEvs9JBXsNx5WSjFFx2OFSTNmHZB5d5xNkULWKJ2YBOnFro7mTK3scIDrYQXOYQXjZ52JsK9wbb
	jYi0hZCv6cEV6g7K+iJY5Wo7nB/W5b76OOCoAWPbvycllXx0hYKjmJuIoNl7LWvF/b4WpCvsNDy
	szr3rwmtyh9u3T
X-Received: by 2002:a05:622a:e0d9:10b0:52d:78c9:9377 with SMTP id d75a77b69052e-52d78c99f36mr34724541cf.36.1786637732593;
        Thu, 13 Aug 2026 09:15:32 -0700 (PDT)
X-Received: by 2002:a05:622a:e0d9:10b0:52d:78c9:9377 with SMTP id d75a77b69052e-52d78c99f36mr34723971cf.36.1786637732188;
        Thu, 13 Aug 2026 09:15:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a68391sm582574e87.78.2026.08.13.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:15:29 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:15:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
Message-ID: <rrjisqkx5bjkbcqtrd7so2fdopvuzxvmijg4oe3cvaz3ccbecr@izesra4p62tz>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7deda5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXxlPJ1rTYYHui
 eKU2nXKT+WJs92yoeVqlqa13wBraJL4vazXMWCGgJUIhLfsytn0n99YjT6jJPYgO6V5LXJL9Lbe
 oshC7hrp1o9Sb3rYU17zirdA0eOAV69Fri/3HRzpl63MNxyLxpYTizj15cZcXYkg4H8V9Qjkcvo
 oSJvWlVp4vSacSyDkac3pyWFxwhmCTyHfVrh/LlPEYIlFOR2MoNYSKpTwy2Lu+acLu2NckikjrC
 13H6/D/r6iWTBpJk0czcibW0iEjFfqxhfsvEEedSig44h8UfEmMzyA7sEGjeDK3I+GAIDIsEB/d
 NCB9U/269adLaNlQW1COeKFgWycth3lTJgcBf8SIpJY3ZgRotvTOqesSre4mTl5HGKUTZSWE2cj
 xjWz8bPvT0Q0wp6zZlaKQzf1PbUSu2qVzwFQAwo23RDOfjRHa2GavFMpAKL3zodWi2AliZ7WAe+
 kk7XJ99+vFxexjBxwUw==
X-Proofpoint-ORIG-GUID: _faChtYwtBFdYM9V-o7xFnhIqJXWHmdQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXxY/e4mntxcAv
 mrQSbLTMbs4+GkOeh2oqaLiivubYCz4XBNhTyPBUTJouS08XV94UtQi1lUJfecYmY3/lxpqOCxM
 P+kuD8T+GHDJYaEWoQd5852sg03j0cE=
X-Proofpoint-GUID: _faChtYwtBFdYM9V-o7xFnhIqJXWHmdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130116

On Sun, Aug 09, 2026 at 01:53:13AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for sm8750-qrd platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
