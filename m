Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24B329C60
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404636; cv=none; b=AryfRYyt1OblBadxKHnzAStkqbxZw3XgF3NqAn7lO2qrQjG2slEXhRI1Xh3cVCZ6YQBRJ1zj93f4TLiaIeo3A+xUDK6Cg3dOzr9SYCE9iiQ0IWk0wVkorMl0csVN03LZbLw/jKojoE/nlzvaUDZryH/ctuupDYIaipJFbaG0bEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404636; c=relaxed/simple;
	bh=P9FnOrWtow+9Kvo+KtIS6ZuYrr1L9R4Wq2EndyLd34I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMeXsKb77KnLluhZMDzBnv8RHd1Is3wUJMG2WZ8aReKrE3nQPH0QBrt6hFoQPAfAWi8hx+BHcSzzTgkDrvaVenkuRJX3qH6qleHI3mWEC6MQ5qIiYgW3NXsLk80bP4mCe6wbAQSFsX/naVc9hKFZ8zU4uy39+AJvEd5CCDLPAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jg83+l2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0tEdnLS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jg83+l2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0tEdnLS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xZ3G4150815
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 03:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IQwYwGRSkuZlx9JhvoUV/XoX
	OWFcMbYe9dIg4BR3CsM=; b=Jg83+l2YDmIje7ohnnrrmCQ4zSqtinAriN0sJOqm
	ACRQN56aZeHY7pHifkeSWZun150i4Ti68nfiYvex3PT8Fg+rEnYrmT6MAtQ080g4
	quUDOC/u1svnLBVg+FP/Iz//wN6GFVjYMjiW44b4TQSNeZbsn+nNDKmJsjPukC1N
	0jXbj2RjeKTtpnVs0vtLd3PUVkygydBvBd3prQoSC1moTCqeGhtKCQUwPHp7iY4s
	RZQ/dN7QnITJS3DxmlWKPS4eEPRqDAMzpC4Rj1R5pEHXxZdDg5INXjbNj8LRYb6I
	KeoxhdNf2QEsXUXwILnucTjiTP6PSh8C06Db3Y6dWOu8Bg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdna5uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:03:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso637872a12.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788404633; x=1789009433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQwYwGRSkuZlx9JhvoUV/XoXOWFcMbYe9dIg4BR3CsM=;
        b=D0tEdnLSERjn3mTO7eiV97ryNYeRdIpa2sMfSVU3TW2gELYaGVpsEv896T3yt8Fdbh
         zwACxF3+22ZE4tFcvIwAns/yxCevL1p2uIOPQ4edjZwDPrw1vCY3PKMscVazqWABT1fV
         16Ylu65c1DzF1Ty0FPLls4OttWKQkRfVTdaBevPeyCqPuMHQUMxwtTSFSCTvB04xW3ZP
         fDgmU3ulyjWrgBPlZMZQpKIOIwThHXBjCTc5r4xpPXQfZ3wkfFr44NNZ5/Nu6QiAoFFo
         5qvxQoscE2gZH02+4QsxfAuBA0EN+QI18V/plhQSFW+xNFMoPs5SRmbAVZueN2xXoOmB
         ilKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404633; x=1789009433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQwYwGRSkuZlx9JhvoUV/XoXOWFcMbYe9dIg4BR3CsM=;
        b=E/ZhnsD/mjfwZa3/i58CSBjvJcl7Vl98QD5gyJwVf+C67QYWtDkTQqCoIbLg13FqIT
         LGYj9txkaLgrrhv0TVUk7/KDFAszqGRrwmLD1bYy3EIA2PCZlXnbz72m+nE+8vggLfer
         OB40Mb1EwIbTB5zUZhyIxV1H9rOX9M3UOMXURq3mMpd1MvZpaYPrdDhVj7a0VfTkJsGf
         UKyxoptH7x5rZFSFXzq6aeieTdqeh5w8c/7yGzXSm4PmDv8xmE6zCcXifU3GZF4Z41S5
         4D7n9KsLYFI9dnCF+UIljTWjS6I71VcnDeV67uGaBclVgDKstONHPrLQVmwSkIQ3F3na
         6e7w==
X-Forwarded-Encrypted: i=1; AKwUvBwJ0uNIW6rESIzTfrKOPcpb1kRyg33RN4GVDWcwPe5yJrJ9Reafn+3ch7N+AaR3Rb3WQlLTmSx/QpQ4@vger.kernel.org
X-Gm-Message-State: AFuF++n08iCbWJBbajP+6nt1zBn2rH3ZtuarOq3C4zAf8SYKXJuroN++
	BOJCI46i9PRYHQg78+IE22NTyO3DAzFRr+jcXOowdJXEanBoxJ0xdLvxYVM46ZJMyjuhEIhd+oX
	b2wiVcRzv4ibA+slrOkmLoc9nLytHiHgPdzICWeuVBEygx9znTptQbtcqGPzIFdpu
X-Gm-Gg: AYBFou15Y6VMYXJsfd2Wnsa3nXfgASx8+bPEEBsJAThw+isWLIrLW7veBOpXFzhwIft
	M9dzZnFA/bX9/YR95QPGjKomEBE7tiRNOL3ElVDjAqFQSJNBHOpNVpPjsCUqDC9jLgCeBOGNLlT
	m5FJCU+ivf6/gTwuuYb3LzE1xu8nZDdtndQKTkTtONvldQU93FkyKKH7uOc6EWYw+RDE/rV1/zr
	OlGoZvLnTYG/czBk5RwgIQG2vcHoHDdp9mV/ewiiAdBAGJdVOmbj3RUaFlHWLZtScHsscxd+NXS
	xESOo1HgAZCLwTthinVSNTgV+Eg4GccEKwXlQxWXnOfDAygfMYSeURgXMzE/OU6hpmMFGY8dQ6q
	U5MxV9vC6PyLkTB4TnZgQuAodhPENIEXVmD7tRFE+VdU=
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr3748207a91.4.1788404632738;
        Wed, 02 Sep 2026 20:03:52 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr3748141a91.4.1788404632197;
        Wed, 02 Sep 2026 20:03:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592d9c5sm2215705eec.11.2026.09.02.20.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:03:51 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:03:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
Message-ID: <apjjku26X87-IjZU@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
 <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98e399 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EvG0u3NYunSZrgkL4gYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX7WeovofaoxOW
 rcXh1poHUDIX1youu0zAG8uBYzsNJ8AuNcQ6//OmlsFgX18cbfUjaR54UKUen89u7hHBS3GlYR1
 FTIyKqLCE/dqh9/ovW3ArmOP8ynieJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX1nPc3CohDVgW
 WNIPwGIgvY3nWwzD9tPWVmrrhgw8apaLWYJRY1TYfcAY4PlnBNQv6D9b/nIVpg0qPo7LSLNDh+e
 oVg1tPBb4fql4TZVDnnTg/LAkmW9wGVuEJVjVSC71WicQacufUOxvVE86k1LWbSMjXfog3e8p12
 YuL8VpB7wcg8Ofj1pn7T1kQeah/FyYB+bcLqEUJyi2QXf6EM/lX3qZ0ouK1D3hJkYmxuZyepAUy
 hcsx3m+T6p0KKxWQ14UNWdbQEpRbafUdQnSsJYdrkp/dyMm/SdeCt5xx1tLAhpDVtVInsxN4/DM
 JOjJ56xGVDWVHMgoaF8Att0g1m2yLZLaHtdzzVPZN/QqJTGd63IIh1qgxIoasfoArLD8w6sJFT0
 UMYCe78CieJ5x8ip0645tFKStHOKHQBDxNgP1sLFwJVrUk9vElEgTsFTji+6IpbgAkiakxOEATb
 TYcP4XNWDvTD0pSejbA==
X-Proofpoint-GUID: WHVKV41lhRTUfRf1hCNhTJT5eFu6cqbw
X-Proofpoint-ORIG-GUID: WHVKV41lhRTUfRf1hCNhTJT5eFu6cqbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030024

On Wed, Sep 02, 2026 at 03:52:37PM +0200, Konrad Dybcio wrote:
> On 8/31/26 5:20 AM, Shawn Guo wrote:
> > Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> > on Nord SoC.
> > 
> > This includes:
> > - SMEM memory reservation used by the inter-processor communication
> >   infrastructure
> > - IPCC mailbox controller for inter-processor signalling
> > - AOSS QMP node for load state power management
> > - SMP2P nodes providing stop control and fault/crash interrupt signals
> > - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
> >   userspace offload
> > 
> > The embedded variant specific power domains, XO clock, and interconnect
> > paths are filled in nord-embedded.dtsi.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> With our previous discussion at <ao5Vh_d_dAlJknpl@QCOM-aGQu4IUr3Y>
> in mind, can we reasonably assume the ADSP description is fine as-is?

Yes, ADSP0 can work independently just like the single ADSP on other
SoCs. As audio support depends on ADSP0, we would like to get it land
first and leave the cluster support as an incremental change later.

Shawn
