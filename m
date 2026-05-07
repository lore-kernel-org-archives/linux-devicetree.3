Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2EF26ED41
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130262; cv=none; b=XYgIuJLlNVZuBDrG1Svme843xrBld2PNmn0uTywXXQq/Fzg4Zz9Ck2CqJN4CYyFcPWCT5BkhfW5tEoG25SgAsJJYMfL8BnipMwwvFNzMlo7EIVG+ki0ZWEkVp8QrCBMhwLsUQePp/2ZnMqfrUICuJ5izeWv2GgFOkUD/UhkmPKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130262; c=relaxed/simple;
	bh=hgqjW8KfkqTcrWolB9guuKyPRLtFQrE2y7JWIKYzEvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM22qiAdO7YQXUGqNofg28dvJTHyZRbtnH65l3c3ywsfmzh0UvBM7c1pfkC9qyN5T0kJ2NScB5h3K79DMeE0e4HGxliKzlkCZG45nXDAbIwxqYP07Hlwj2rM/IScYJ2r4+KCIQVsxdpgkPVDhhGZnMLL2FdtgiZ7DZUyI5SBrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO7AI3SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+Q6ElVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO7AI3SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+Q6ElVk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eA7h1669568
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 05:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=udpIyFeLuuX33ymGmzPtSW/W
	6I5xBEaw/yKDVf5r3nM=; b=LO7AI3SBaYnt4ROPEdpYdRP8zwPlm/jqsw3QVPs2
	N2BFAHROpPN7i+v+QhuTpWO0uzfzEU0SSjkHITB047Eak/tvPxrEIdcGARAEyaDh
	yUL+w25b34apgLNyaHZUS3wOqHTwgfsP+IYJHT8ZcRAlDeU+vCZl5/YhlNnl8gEg
	7YH81a5IHJF7EOUoQsJZp38AlkRf6LN4plyXG2yU3TpN1thKeUlBsIj5APdx/RJf
	u4jw4s6G5Tw/Vx3zOvAIdpKaSbwEK4dNWuQsNP3fRq04EKRT8S03bCGHV49TuNGj
	xPukBWGxaC42wtX1PJ65PYJj/ypzP/AjGEth+pc65kehyw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p073u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:04:20 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8ccc7593so1140368c88.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 22:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778130259; x=1778735059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udpIyFeLuuX33ymGmzPtSW/W6I5xBEaw/yKDVf5r3nM=;
        b=P+Q6ElVkI7/poSx+Vq1A4Y4nwQDbfRE9OD4qt9v28wunZUXPdIYyWB8Cng0l0wTUtr
         ftVIw0vt6qY1fRS8F2LFmlIHAdNW5rCL3mnXz4derxkirYUaWwkxBLU2qZo6omdlNOG9
         ey+UT+/5XMEkBbsFGIgSB/QLGam8pwcfmlsnyeYQjVn8x8JLWNIb7UreZIUGGTgU/647
         wzfIdEB1WpAiguZsJch/sPs5tsUT1bDtBNODF4YYQNVd4MTiQEQUZ5bcGPho+4LLUbUh
         NmiNKYZvsIX41f4bG4e7jASsS93ZWxy6PYqZQhhfUFxZalaQmj+vHSkmEr6GQT4vPkzd
         6GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778130259; x=1778735059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udpIyFeLuuX33ymGmzPtSW/W6I5xBEaw/yKDVf5r3nM=;
        b=fP88CzBgCQV+vmvNoFIxApN+eakXlaRfEFJTjOY/XiDQaApZ+66xhNUpHEaRpHYm07
         pxu5E919GuV4X3NwiAe8hnnlV27NgZPDdHXfdD6mWROXwaQO2C3kH5QlnlVMETwe8UF/
         JjqhBDC9dIScdD+kn2/qMlNy5hvkHRAhYonjNed4qzuSAP5T5U5Re3kc6MrtE1TvrzVv
         aDMyqQU5epVsI002DUTZUrcE9cQ+YzOYkg+Vf5pMJh0bYH6aOaP8U6M+uCTbIf8HxOAO
         husCxDoteBlcvJkR6yW4mF16K97MaApcRtyHT4rJ4SZiz+HBjcuxXL2oQRZI+zvoWIoS
         OcXA==
X-Forwarded-Encrypted: i=1; AFNElJ/QzzeWgn8ndYx2mGBn4l0rKt1m+wIFpdVZNDhqYXUMpJEKsL+otu1+QCqqM2fUz1LSW2aa5r3QdVyt@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqtKOPqqgSAuC39F2R5WUig+q17aXgOznwJ0JphC9lOmOQP2H
	JLf3hpkoNeKDhR/tCvqTAHjXo07qTcClfe6oGmPWst5VegrPiUJ5NZQxDTvzKwi0rM86uFa6GvE
	Of1zWpq2TrDuh9YnfrT+YI7Dh0x2YZslcdf8tq4ViMgt22zGGZVi8AslMybEfIKfg
X-Gm-Gg: AeBDieso2+E8n5Yqm2/YDwZbByKrXUakEA1fR1KiHLFqTKgtXDj6EUkxUa9YFpkO1x/
	TPerUBKXrZ0vnMvv2y3XP5t0J9JSpJILVKUn2NVAXDupWYfCHIyOFOlFuVF+YjzvsbD+474CwWu
	JgpuHA4iH2dRc7z/X70yQU5x6IAPTjrWXWneTBaBuMSBibt4gqOFQ4BYvDhXbcQFXl+xcc9rt3W
	U8fRdjTprINOmM++dZE8Zskd+FsvAe45wjvC7aOj8iCJ3y8rq/8Fh9QuWYsYZnRMPOjPMRRwPlg
	gzaAdlRuu5fVVZlrZFlVLqunSMit5dWT+HdGj7FviClJLDngc9/9TfA596O5maUWttnSxyVmq38
	uqmWhvOxq+qFw1IofslhfTmbf/zxt9Ln6/mfNJJslE34apB057w/KzgJItdK58fAsKS1QW7jTm3
	c=
X-Received: by 2002:a05:7022:f005:b0:12d:e539:98e0 with SMTP id a92af1059eb24-131963a0fa4mr3238563c88.39.1778130259265;
        Wed, 06 May 2026 22:04:19 -0700 (PDT)
X-Received: by 2002:a05:7022:f005:b0:12d:e539:98e0 with SMTP id a92af1059eb24-131963a0fa4mr3238544c88.39.1778130258627;
        Wed, 06 May 2026 22:04:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm7142762eec.5.2026.05.06.22.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:04:18 -0700 (PDT)
Date: Thu, 7 May 2026 13:04:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <afwdS5euY8bxxA16@QCOM-aGQu4IUr3Y>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm37MruBfXAjLpZ@baldur>
 <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA0NiBTYWx0ZWRfX9jMkkBP6Jkhj
 O6Yi2c+BTc9jTv8b2Ucj/FthIwXioASaGt7B9mxj/qpflVIHPociW773dCMt+wtaJ0xaSjNut6V
 uPTe+quqJQ/yCLRcH5FkjbVTCWFVcgqkhAMh3h/2ZdOfpamMwrBs4veYr5JlmzSARJ/vAF1e00C
 p5fWM0hbXY2qkwkFrZ8bdhIBex+6/NsoTfvk1GmGJGH8TBMtNrj1Rli7DtEuQwnu4jKR85Bedw3
 ZiCDoyed0IAuRhfupy53jYrEKtf+Xmhkggt0d+jDMN45TiLeD1n0P5tgV7esfw418TFKGg9qXUY
 ScmPchl5ih0UE9sOy37iZN2OCg2zi8IFU/kijOdGLmxyxtdkXdT6filYKXCiIdSh4YUTGqpc5MH
 5sCP1Hmp3Nk/xcqbcSf17Bcwa0J2oBlLxYukNyIQSeDvvKfPDqAEta68hRNVpIzSW4IxW0MlVBK
 +6TlmVdkSg18T8yHSSA==
X-Proofpoint-GUID: 7Resl8NBZtIFvE2MeGlO4PBFzHc6VsTa
X-Proofpoint-ORIG-GUID: 7Resl8NBZtIFvE2MeGlO4PBFzHc6VsTa
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc1d54 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DzB75-1vIS7bBwd3HdEA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070046

On Tue, Apr 14, 2026 at 12:56:11PM +0800, Jingyi Wang wrote:
> 
> 
> On 4/11/2026 10:59 AM, Bjorn Andersson wrote:
> > On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> > > Subsystems can be brought out of reset by entities such as bootloaders.
> > > As the irq enablement could be later than subsystem bring up, the state
> > > of subsystem should be checked by reading SMP2P bits and performing ping
> > > test.
> > > 
> 
> Hi Bjorn,
> 
> > 
> > I still don't understand.
> > 
> > Are you saying that devm_request_threaded_irq() will succeed and then
> > calling irq_get_irqchip_state() will not work? Or are you saying that
> > SMP2P driver isn't reliable and we're loosing the ready or fatal bits?
> > 
> 
> This says the ready state is getting from irq_get_irqchip_state()
> instead of q6v5_ready_interrupt(like what rproc start do)

Hi Jingyi,

I guess Bjorn is questioning "performing ping test" part. Is that really
required?

I'm testing this patch with Nord ADSP which is brought up by bootloader.
I have to remove the ping test to get the ADSP attached, as it appears
that Nord ADSP doesn't support pong. Are we good to just check ready bit
for telling whether a subsystem/dsp is already running and remoteproc
should attach to instead of powering up it?

May I ask you to copy me on the new posting of the series? I would like
to make sure it works for Nord ADSP as well. Thanks!

Shawn
