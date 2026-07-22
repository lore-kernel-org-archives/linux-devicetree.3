Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88B1B4138
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724056; cv=none; b=fQRsdNQJGw1/e5iMdfU8iIu+Evfqp9p+fyBDqcieY7t3dtVHL0uG8vrdvIyIJ2B/nciz3KWjMawkt0j4vT42Vth9ujhNg0CLrhnK9d7y+Du5MHKHlro9HRpSy1u0KiL6fohQcU2RIIksUChGlojAKFEySHiRrRQMvRz38dSXWfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724056; c=relaxed/simple;
	bh=7ybZsVcQN64VtM6kgc/F/hu/d83aDdEImhyAoeKwPlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzExrQmwZlsAbeQC7KtuB+KBHZWNK5VG+gRmfMEEoP8QdRj0ix/ezSZds5mFOlgd4HzRwv7UMZDmre8i/94JIE58kKFrD/cWfGy0LmukHy+KAv5/hskPyYOBCDoRKbDUIRvZPhoqXfz20xdC3SMZjcCegag1lDuc8BO5oQrSLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr/yTkBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9+OKIFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr/yTkBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9+OKIFP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xGCG401471
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k6+d0wKxA+NLdRiQt417IxkZ
	uVWKl6XVknCHTu9Cguk=; b=Vr/yTkBASph8kTlZx4WQR5MWM5tteIr43lCw/+mt
	hid3Op6tnftnY5OYILN3uo7rGNZhJdFLimmsqrR4uTlrzWJV1ThQHhA/SPIMUCIb
	p1RHFYgLgtu+kZqafZsKQflzFe7Mb8NXcLhHs0Hre2kKhlV1w9YSDktMh/BtCtvh
	47odtlBqey9Rdq3Fw+b41wLRTfMonYK5bjvBya4BmO+QMsl+1A3DATDC+1gUUhQv
	GoJtAXfWLa+xvgw6CMZhJVShQw3yRHSlNPYVZzvNu7i3DpmeQkJF88jLhnHxYBwy
	Bc0MsSR0AZiMwQaq6vvIvk6gXydr9jxacuTTtGdIO9wDkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7991s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:40:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so218256091cf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784724053; x=1785328853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6+d0wKxA+NLdRiQt417IxkZuVWKl6XVknCHTu9Cguk=;
        b=I9+OKIFPR4LbC1ZuVPTVICHj1g9SXKSuNtJnasPwctveIfeTPXnKvLxKESJJD4Kf0N
         UEr7vCY8/Fg5BOaFdl9iL2+g9O6jLVLfliTGtLthdPTr3WFyo+R1WngPEy4G3WfQyUbX
         oBgnZKW0/f5840eQk6pW5TBwj56cKL9GJk9kO7cqWCtPIMQ+pzM+MZ1N8xXRXmzt5A1T
         f8+ilOobgP3lGEzQrE9AACH59zlAw6q+RrB1XZ6bEq1eJU/wG9M8D82g2LYOfDKe8MvR
         txjTE9F5he7Ds6SBYybS4TJtm9Vo6Yb3fSM71AcZm4hIaplMI9fuL7kTPtd00uB+LqXu
         eFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724053; x=1785328853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6+d0wKxA+NLdRiQt417IxkZuVWKl6XVknCHTu9Cguk=;
        b=YuKh6mS158A6lN4q3WK2lzfzAoFdUehcdgReS7Ar97TWjvrxGiyAb/nLCmhLHJ10rj
         oeuqyygRHuT83WBIqvvFkoTM18oJrIh9jydOvY+hp/j/I+k3Jb+kJTJPjEGopGgJc3MK
         MEeXkTrD0S8LofNNGEdzCUsxDvJLBRr5zNAgz2ZLNV8uxkhoApl6BLreB0ALL1qpA9Fr
         vAEYACsYeAKSSDTMEJY5Ay8jR6l8xfMGARkn4sEP904zvpZuM1A238dBb6f8CiXjdd78
         B/Ua3sfGF2709Xdacnk2zEghdx34xPTRXMdS/mEiTQsD9KzyOMZU64hrrmAyo4WtSlzK
         9oug==
X-Forwarded-Encrypted: i=1; AHgh+Rr70gjw9zx1GLyX/p/Y2730yv9uyo/Mmno85DJ69Q+1e+ILsRKShPGM2wqFriL6eZ+q07fqGTL2JNYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvzmfiWrurV2xxNXm3gzbGfT6jrr9dXno1LIRXSVzDY6B+W2TE
	HzQgg76/b9qB8EvDAwHdrsOf/UbHUCTnVdov/sEyMnIeiqbu6RTbm4+hyClq4LLSbc7BA4+6wAD
	PSZN313kZR162nMvFZf3rIOJSQuDt8k2bL34+/sImLxUiUtPbZkxniLFRA4zBgVgl
X-Gm-Gg: AR+sD11eyy9mEg5eGrRWkBpaNkJP8QrqLRl6O1PE0dCv7+u/UsrFLHez6ZCMen9zL2f
	FkvDevSAknstM/r8qGLSkzT8fe2pRIu70bcAd7fFBoENrNJ15KNpW3/eoJmMNofjJ6pKsFxp57U
	7HG1g5GyXp8i+HX8jPOjvH/0z9AEbARBuv2LPWYeZxDsf+0piJrXbw1nMPqU+yMvaJGLRVHDY08
	JlNcf559nIhAI7fCzLxtLXMBU+CakJJJKLwabk2wLR65uT6eA8yUyZlLGv28VR3WlHGo0gaLiEH
	vF3LxCPJT9rVgXmcn8KYO0xFxbNsUyPyHbQV6t65d1AhPeQzQ6xLfm0Wp+pkWyeK+rWQNgMmXYo
	TtI0+1vC3ci4ZXMSVNlwvzlDB/s+aZqBSgFgd0hjf20zh2gkv5Z5j4HLrZkh0M9aCSvZ2cG2myT
	bAd8yvDnlYzVlr1Q==
X-Received: by 2002:a05:622a:a0e:b0:51c:1ff:2515 with SMTP id d75a77b69052e-5213e188477mr222598971cf.65.1784724053609;
        Wed, 22 Jul 2026 05:40:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a0e:b0:51c:1ff:2515 with SMTP id d75a77b69052e-5213e188477mr222598651cf.65.1784724053076;
        Wed, 22 Jul 2026 05:40:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm448070e87.83.2026.07.22.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:40:51 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:40:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Message-ID: <wx3t6tdk3dsgbfe4rexxdekbhtaryfjpf4dkwscyzhxnnsgzdo@qnvhzfai75nx>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
 <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
 <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
 <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60ba56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=GxFIFeY6bcelL4jVc2oA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dvBR9RXp9pk2fdzm-6Qu94iAfR07xQIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMyBTYWx0ZWRfXyLzg04tuHFaR
 oUntaMdAvrR646VsUxSp5A0KqP4inuKTFN4WSShjcA9fG42tM7mCIsZwP18JIMXoAylPIA/nBHS
 R6swTkeP67JA8mGCY3hcPZFd8peAEvQPqAbzLYK0mRFzDfl5C5vO4m+HtbXfKjr2+W28ZKpNJh0
 /SKDs7eK2Htnep08h4xFhhcmYDTL8nGtNcJFU/Pd8s3fnEATrVGc5MGiFNqxOgtBi1t8Fb/QKWn
 EkUwHj71/pFbvB7yX7reTWMClUhhRViFQRM2D2T6YI96xl5ke5gtY/+1Pch25qgGNMk+DGuqkD4
 u08hxS4WpcES9+bPjymTIFHIJQXEPiOACXadbjIoU+tFwrAUkBZW/VLd/sXEvidqDxbUn31pR7+
 G04E09LBdQKvUeUIgICBUdRpCgb55j8iPGt1/83tmZvfuHTJ96ogWxA6RH31/EPjDYFnShVt63F
 1orGZu4dOqoyIjEPdDw==
X-Proofpoint-GUID: dvBR9RXp9pk2fdzm-6Qu94iAfR07xQIf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMyBTYWx0ZWRfX43Cumm0IOAYZ
 1Xj7anzFUSjFacp3n9SWJFNDyyOdCya3c39KtOoEOt26W3aa3VTGuJtPnALRIvaAgjBq3KwaHE8
 f43MtSk/kH3QX15nMnfygAKvOgEnq+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220123

On Wed, Jul 22, 2026 at 10:28:44AM +0200, Konrad Dybcio wrote:
> On 7/22/26 12:22 AM, Dmitry Baryshkov wrote:
> > On Wed, Jul 15, 2026 at 12:01:42PM +0200, Konrad Dybcio wrote:
> >> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> >>> Do not mark MPM device as power domain since it leads to idle-states init
> >>> failure because of probe dependencies.
> >>>
> >>> CPU cluster power domain node is kept disabled and hence CPU cluster will
> >>> never power collapse. Do not register MPM under it in this case.
> >>
> >> This is only the case on the RB1. How about we fix the issue instead?
> > 
> > I guess it will be fixed by the MPM timer being programmed correctly.
> 
> That's patch 4. Can we test it out?

Yes, with the patches applied, cluster_pd reinstantiated and set as a
parent domain of the MPM device, the board seems to work correctly. I
was even able to revert the I2C-gpio workaround, the device works
correctly and can reprogram LT9611UXC firmware.

@Sneh, please post the series, including the fixed Agatti DT (and
deletion of cluster_pd + related domains from RB1), I'll respond with
the Tested-by tag.

-- 
With best wishes
Dmitry
