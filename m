Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74D3DEAD2
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776090885; cv=none; b=NmYQ53JA8UZDX4oplBJnRW1oFOInasEZg4aoZ1xnElOfwQrcwpkzNGVH0kmUZFgmTbBtHQIPZoKuRTrcoyGaK4T5Z3qS/1Gx51X91DN1LMJijMgIuDkgLwko3CFynYlGrNvcRsHwyura/dlV/sTmRjWK/ly348DyO4G6O1qD3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776090885; c=relaxed/simple;
	bh=CdNj/EVBvnJwzqhkF5S3XaQ/lNgQDLJPYlQQ2PE6P4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY3syQnZm+50apkTlroIJzf64/XzeOM3JdJm6eJoOmuQ8ZkZ7lzk3suQ4YPYcOeYzXV71cehgsz3ok2ja9FzbJWI0OwkkkpM7tYzRg13BzMYsNhorhhvgEbOZgjcBWatU8oyzOoShsbgHPp3YicEm7y8CIZJ5IoQIYBGFfaufUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZWmkokl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9A6ms9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZWmkokl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9A6ms9r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDtnmB136227
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J511wH5FlpfDanfQEjJYrxwz
	t6mB/ncXMWLvOptG8iA=; b=ZZWmkoklhQSW4T5Rs5Ql9RtSjCr40YsOmZedzEKP
	0OJsGWwthH7DDvR8O+6FoVTXKS5jdDMV0UwNUx+lJpgL5AGzxTzAST8tO93OiENm
	aEc207yF86eOX+St51ohEQM8UhsvrYCzCP5X8A3cqz8SG059u6jkotD+oUjeB1nW
	xCRfRKMGVIv54rb+DmawC4U7ydtNudN5bTnOhfzNT6bnOo/Nv83tmvGOKtMBDnEJ
	lyWF4lqqdPB/2x7ivtgNBePbFWinR8VqJeGWn7RAMkPWVdyEa5mVXe71t+/u8NFr
	ZQhY3oQlWl6Ed3ljR6uVSUPw0U633uasSFtD1bFEDJfjew==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkwvm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:34:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c6fc58aso5783034c88.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776090882; x=1776695682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J511wH5FlpfDanfQEjJYrxwzt6mB/ncXMWLvOptG8iA=;
        b=R9A6ms9rQgtKtKVR2gZG5ycl4VBMgXwLPWMDO2335xxQl31moIFK9iEIax3gmO/0Qc
         g5olIvHRcoxv7WPKwUs7psiiFeI2TS8IOsN29VffKPLwjpw+nw1EQQ06BKDBfjDfXJjx
         fBlmQ3w2cQiJWUE0QR7zsUTesNYkEr69m5hiE+Y1HgRMgloaVZMrZZkbL643Jgtc+32F
         DX7M5axsmIWhAQPFna+tbs3KT+pXXtuqrj6kkZB+E2vOL2nvwiAjxt1ezl68I9hE47h5
         bS882cCTN/rMAN0TsSPe/ZNjIcal1bNZ/QAx/oP22o/yy7pr28uydiALHthIJWacYTm1
         rB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776090882; x=1776695682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J511wH5FlpfDanfQEjJYrxwzt6mB/ncXMWLvOptG8iA=;
        b=fnR2q7UbCCPxq3nEvhLwpAphPY6tDSual6Oc96Vz5nGjqsLz+vnpcak0TW7lp2O4II
         l3QDzXOa2FHZJ6MOfhPaJ4LkBD0tJCZgoFQVp2pdWhJ1+1tBh6ZgUEH08SPRifjYUj1c
         a+Jfv0USuR90a0gaO4/fxXiHaLIHI6uptEKxocpz+H2rIcDskFKxS64b0NC8stb20aMm
         ubac8OA4Cz5qpi9zKD8DenbGsBHp4s+GvaN7rRBJgnJDReHij/ri5Uc8eB33UlOTm+cm
         FZrqweRL/9eFg+glPC+isU/rUlhET822QYOXWR8q3VRlxT74ch4KLV7T/2lgmYSnrBoF
         4+oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uvgzuYNJ3S7aRRoAyPZYZdlGJM2He3B7IwtuzgPUplCGKR3mptDEqxWuFisX8JU9W+ZHTQ8fNCy6V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/YrNzMTh4KqDKgA5bh1B1TGE3BIDr3kYvb3K0sUR404CeTzT
	D6bDAEYzU835lEQKDEFlVSLZHBpUg38oLIgPhlWnOnXwyGgfpr6LDUm+4hQC7TNwLuwBgyfFAA/
	SC2DLIoZtgjwZl95Av9tK9DcBfya1sniWPqrIkZkWtcwZOiQblruNF+i7Ax7XDann
X-Gm-Gg: AeBDieuE1rQLxBlwWTab9RceveLP17OxTuyqgfJfTTdu8ss5wt3c/+vgmW9PV8974S2
	HNo2cJAzShBJuPGeAEnLUNkNlB18gCtlkvxW32tcHwc2RH2Z3QlocCTuSVd8SM04vd83BpwhPbO
	d6fU0pXmeGf+KOZyVbahdPIyQBurxh1PM344KAQ9J8HleQI4UUzy/nH1ZCZXqXWRzYTBJUxpU6T
	BHLXZNJfDWr42VArGo+UZzrrvgXR/nugRPk+bOSFmyADvEBxeF0KwJLQmn8WYaJINy+pW0r4HUo
	h5LJtwwqpulyHiH0YUYHpeQPEiTDTHD339yCfX6V3tp8xlwQIjOInx1bkZ6ARZKUb4vx+YDyBzF
	Tfi//Okm1XdbhyeJKdNNnMsO7ze5Rcjo/1/4VjqGenJrcYHbDwEnU+XGXYpgVCMMd
X-Received: by 2002:a05:7022:327:b0:127:9e95:a2f with SMTP id a92af1059eb24-12c34e714e3mr6704274c88.2.1776090881967;
        Mon, 13 Apr 2026 07:34:41 -0700 (PDT)
X-Received: by 2002:a05:7022:327:b0:127:9e95:a2f with SMTP id a92af1059eb24-12c34e714e3mr6704249c88.2.1776090881212;
        Mon, 13 Apr 2026 07:34:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c4acc7d6fsm6594668c88.5.2026.04.13.07.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:34:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 22:34:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcff03 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=9op85udBEjPWsePlfHIA:9
 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE0MyBTYWx0ZWRfXyXR4pdco6f5c
 P3lFOT0vPhFs9SGtyp0HISn58pgyt7cIKsTBjPXgMRoBzY98Q170+gOvJ3d0R1tiY8DwfOelIrR
 lO0jdi2xWB1+yafPO/uYYOErActIaAkYdQrBcx4jSTKsZ1JlUpv8+HNhvQvMC/q30TczcJ5y9jn
 8DHrg/T5EAQ8BTYzXl0tOCk/fMe+TkNJQKMsg8Anu5QLcLqf6zmdN1pJwuEnPJaLmBKMgl8IYd/
 kg6XqiCGVNmkqIOWnW/R2obuWN/D3gRr83HCCSHE+ydBPy9SCUAnqVzlfmTDERkTUmVZFhuFiqX
 c0Ich26dVoBffKiDcG940nihEO6EvBGQ7YLTbqfawL44V2oiL+SdMcfuT9rrHYVmTkvmozseaLH
 4lKvzqKzV55lKxUrDuBA0JCnnmHX+leM8NFW67BkDJPHtJ/2xpYa7gIa5mzEyYt66VYmGrY17Uf
 9gWPEZZhxAnn32zikZg==
X-Proofpoint-ORIG-GUID: W_v53RkQPCXisGiHjIc8_FRC0gwdbz3j
X-Proofpoint-GUID: W_v53RkQPCXisGiHjIc8_FRC0gwdbz3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130143

On Mon, Apr 13, 2026 at 03:30:28PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 15:10, Shawn Guo wrote:
> > On Mon, Apr 13, 2026 at 02:40:18PM +0200, Krzysztof Kozlowski wrote:
> >>>> Please organize your patchset correctly.
> >>>
> >>> Are you asking for a big series that consists of all the new bindings
> >>> used by Nord DTS and DTS itself?  Unless this big series gets applied as
> >>> one-go, there are still chances that bindings get into a kernel release
> >>> without any users, e.g. subsystem maintainers pick up bindgins being
> >>> reviewed, but DTS requires more iterations and thus misses the release.
> >>
> >> Please follow existing rules, communicated multiple times on the mailing
> >> list. Qualcomm also has internal guideline clarifying this.
> >>
> >> Below are some upstream discussion clarifying this:
> >> https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
> >> https://lore.kernel.org/all/49258645-d4d8-44a5-a4fc-b403c926a5d1@kernel.org/
> >>
> >> And how to do it:
> >> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/
> > 
> > That's what I'm trying to do, posting bindings in prior to DTS, so that
> 
> Hm? Nothing above claimed that. I am sorry, but which rule either
> communicated publicly or privately encouraged or even allowed that?
> 
> > when posting DTS, either bindings is already merged or we can refer to
> > lore link of bindings.
> > 
> > I still need to understand you comment "Bindings come with the user".
> > Are you saying that bindings and DTS in different series should be posted
> > at the same time to show bindings has an user?
> 
> I am saying that you cannot post bindings alone where there is no user.
> Why do want even such binding? I see no point in having it in the
> kernel, unless you speak about very specific exception, but then please
> clarify that exception and why it applies to this work.

I think I'm getting what the requirement is now, but still not sure what
the point of the requirement is.

- Posting bindings and DTS at the same time doesn't guarantee they get
  into the same release.  It can often happen that bindings are merged
  alone into a release.  So it doesn't really help to avoid situation of
  there is bindings in-tree with no users.

- From what I can see, there are always DTS patches coming after bindings
  changes, sooner or later.  No one would be bothered to submit a bindings
  if the DTS using the bindings is only kept out of tree.

In short, there will be Nord DTS using the binding coming, and I do not
think posting them at the same time should be a requirement.

Shawn
