Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1553DEAEC
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552840; cv=pass; b=lKzidxjpuyY6ZP7FqC1SCR/yMdAj9mrpRBPmvOeFYnNkdAoGmLibS3ZN3p4Bi7hy097BtZGdEFOo/xqyQEb96ilTlgSlXzb7va2JhfIAbyQGTgtkv5mXCstsKvQhVUWSE7jRovy1F7aZ02X9aQK16ec4J/hPgpafDguMzqk5Ito=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552840; c=relaxed/simple;
	bh=SIm4RSZUKrJB5nvKh8RCyJ6hLv0Z2V2NmQ/YE74MnLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1RElgC4iC1WaKb5M1JOKtRKV/TtUg76pQm/00vRyWeqfCbq67/M2VDhaAeFNV35bBapHECds91dWJXk9u9aHfXdltsqzuNgOkm3cxulN3Icy3DEIXY4Tk8jVcOCigcdB3YY+DswCr3INS2WRz0upW2nir4KbyMOqJriIjPdgco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvOYRIIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nfw+WUF4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvOYRIIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nfw+WUF4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9Ms1848218
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=; b=cvOYRIIL5TeL7uZ2
	3x8v4ZZUVR/pK5c8mUUaS78Kno2WULoCJ4hSvUlisvCoQwl/hgNH1jB+GBgIDnRQ
	4loT1E+CXJx1CYu77EYYTdNXbqiy/M6FETMe382xCL3u0PjRV5jf4KJx2Km+P646
	lEkPFvR74fiYG/pwSPYlEbe5vAWE0cWh4nnvV1QPhTMeDwSakSL79R7b8uNVxgcW
	SorsPt95Wlv7EEEZadUi+3e5IiUsy/Vz10bB185I37MSAAK5/nISN71vlvUjS1Yv
	BXqid1KbKspGeoH0WzPCMyxAyg59tqVF63K8UsubDet79AXvhK/WDOfu9S+8MG2/
	kAe2Lw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f5pd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:27:15 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c9841d667so5103530d50.3
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552835; cv=none;
        d=google.com; s=arc-20260327;
        b=C5pX99Gvgp0AsUC5n+7mv0TxD4O8DQzlAlH0FhiUovYhE+VzEIs+B70G0NU7vK2Fu5
         dJS3lxAvLm6YcKGf1r4FnJr7tyFnZdbCmUMmBXGbhIxGY+zZdcmhqmDq74V7mDJvP5Mm
         X4eVVg2AOAVM9Z8gUZYvn7hbiJJs3YInoABvaqtOCNCVFIgoVbzgCigNjsY4dvtDKKQU
         Kgx9NurlIizeBNzHVYh8o5ULdUrfi1Duq6/PXIrw67A8mr/MbKTnut9gpBkT5xZMRpII
         fKcZpeV2jVfrMgkh0QVmifR66nb+pT80ee/UM93ONIwdUDL9ardBlHWS3CLQSq7FLEGI
         IDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        fh=bX2zL2843aYu3Mh55A0bggOTTC8ce54muHBts22LJcA=;
        b=hxcTb38TtJeAXfDz28EtTBTAlcERjTYFVb7fzksStNeP2feflWLPoqVdp3B7e34sid
         4pnEislB4AtQMi9UJHi99ahdlnKDYa/HkpfVNJzWA8Hs56/aNH2MVff4wDFt+QIc+RJ7
         Bhf6lJ1w5MQN2R8ycTzwN5OCtbq3IyCAiLLwYL/jCtrrlJiduLZcGrtFWWx/CcHgkbPZ
         7+PiBq9xHnTgwdMFZoH5RX42+agxuYmn1TcyHt7C3OFR+7I1bi9uyHPFyDh3Q1pA2XQQ
         EnkjhzU+fBh49kjTRl4zFZIGUo2+DF80IZlOmJKk3w3j9hpe8TYrqqOTQFMeCMo7a43x
         clBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552835; x=1788157635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        b=Nfw+WUF4lXHOozfI5WKEEF4feDFMgTSmw8B+sKMdQ8iYdrqJoFoU8Kbk1WDWDyYrQF
         eEtuLD4vvuAFZYGZzDYKlolNbagDV5oo67Eu58PjEq/c76nfjuG7K0TI6A4muxk9LuKf
         MRT6jcXFnMduIS/R8uBg+Wk7p/a+x8+RhvBJsXDdTHWuUBOe0AAclHKtPwbimUSuESmL
         GGulQov+v10ZjwVIyWotqbGmlY+HiWvQ7tcfP/hVX52aShJS48qLnWAIb4FnuNorj6/H
         wlQOeB09MpK6ZdQs/YuWO0b+tyTs+6KVK84hLsqLjQ2whezIKOpRDnRh3Zae7wW3pZKc
         Uurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552835; x=1788157635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        b=MHPuI6R1coE6cqCV8BPhZDMwytjhJv8Y7go+b7wTD00Vd+442lklbCPmd0iGah+qSG
         A1qiutEYHGlIqhQS3HcenfuCWAIFGmLsDPMGwwoYVTnqHEUZ6p4BT9BXDLgiXPiTfzRK
         NMccDzY0KV0hu4LnS5uc1wlAW3XLqPUJf7jMrwsfebj0TiqUW3xRJfDrR6TidP5DfgMg
         E4EosTvA21NCNRc9M/Ct0OZ/qifeDbrMiquZJ3gVr0NRGXTBtLIoXH/8ayrJnxLkisK/
         qd2aPIrdYYQTKSA0EQ+90PYz6tiVHM3uybqqkNmq5zMGzi5FTy0JRxtRT2cP/ii7IlRB
         oE/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrlzE7mcWqw6cj59xgpEhwm8eLlkisCoyzio4Vn0NF0cLmEFKhOSm3H3mr/TFIMOkN2YsVcSo45zRrd@vger.kernel.org
X-Gm-Message-State: AFuF++lTp8aZR4n7IuvETRSJiYG4k4mAMUYQuXCCNXz8XqggmcmKT84G
	rTSWb1YAPTKc6ym7YLRNn+/6BqK55mSSEFbWO77g25SkaB6veR6mmiZxJc4yftaB2wAwk+1MV/t
	pswfTjuVnCxzp8QxSIUI3MJhHTqafoP7Vevk8tvoKKrraIB8kaoFIJhX1aNclTx51AMFoTEPUUZ
	mPI9kFzUvbtmtwmyiO7zCqKNAJ53nmpVhJ486L1qU=
X-Gm-Gg: AR+sD12DyT5Em+OM3SIS0QIJDWRE/ZfdI7/waMNlnUlu/tcFc1b+KuYPgAJ9H4a/VKY
	yNRD/Z82oHfPdSRnn3KsXVlysKJwyzxnmDoMLD048K6wdbFKfI43tRC/xZ7aoCnBydutYyBhdDT
	YHs/ATFqr0KIfv/b6XIeLX7zDxMPbFjH+msTLk1o6vs6+IF1gJVuO1xaaB5Bk=
X-Received: by 2002:a05:690e:e8a:b0:66c:e994:6a13 with SMTP id 956f58d0204a3-66ce9946b3dmr7444548d50.52.1787552834913;
        Sun, 23 Aug 2026 23:27:14 -0700 (PDT)
X-Received: by 2002:a05:690e:e8a:b0:66c:e994:6a13 with SMTP id
 956f58d0204a3-66ce9946b3dmr7444523d50.52.1787552834533; Sun, 23 Aug 2026
 23:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
 <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com> <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
In-Reply-To: <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:57:01 +0530
X-Gm-Features: AcwNN1X2QbYM_Ej9zVogxycYXkXw60H3jSbidIvKHElg1_jCPW_I248pR6I4-hk
Message-ID: <CAC-tS8DsKDWzsnu310GwCabAzJ8mBGS8wO0TB3m-FajwcXDqvQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX6rg8aZw7UD4o
 Dtd7mczlzDrcEdqjjqeTb5a1Zm51m0rGX6Q4quNOzgH14I3vk7P6qyrvn+6iZZ3W7vuNIk+dIDw
 pP8qB5qlydaXFu213h4m6ltWBh7JZV4CtbKKLK+ghFi043+IuekmtTcxP4x/PzU+X8qT/87T3Yd
 QQ+nkkCirrhhDUVGwrhZvjt7oAe07/1/ez7yJU0XowE3lWCGJJIsyULe7/fmPkO7oea1sgsypnk
 +1HqczXdB+EqtQ/t75PMOjkpCPh7N5RcKLELWc6lY7McRAhXglL3/OKjskz3wV572ZOE9BJFtOy
 ZaaxH7S+tuffARlPakP2jp5DuEd2ZMoDcULr9tY1ch9PV77dPKS2JnUObUuZEHd7Nw1mC64ePph
 q4w+Hyy7zXT6l91wcaLWGTE5k1HdFtIB3AtuB9FXx4gB15kbBSXOwJQGCWyDVV7+VggiyY2zBsm
 SyZDgWHv2ntUh0wuh0A==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8be443 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OOiOEqgzfLA5xCD0pTIA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX9QeKz9ngRzZX
 P8nzVmqKYQsBSBArV5/BoSxdIJOK+naDcWGZ+v6MsnLsKhJWntOQ6xjrwh2tTG2A0J1rvb9CTdG
 uViWH1Uo/IEv0zskXuNjbBav1SZpef4=
X-Proofpoint-GUID: 5lWVEwNMTf4RjOe2laxYt0H_VdP1RDV1
X-Proofpoint-ORIG-GUID: 5lWVEwNMTf4RjOe2laxYt0H_VdP1RDV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 01:04:23PM +0200, Konrad Dybcio wrote:
> > On 7/1/26 12:57 PM, Harendra Gautam wrote:
> > > Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) cont=
roller
> > > DAI IDs. This provides shared constants for devicetree sound-dai refe=
rences
> > > and QAIF aif-interface reg values instead of using raw numeric IDs.
> > >
> > > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > > controller used on the Shikra audio platform.
> > >
> > > QAIF moves PCM data between system memory and external serial audio
> > > interfaces through the AIF path, and between memory and the internal =
Bolero
> > > digital codec through the CIF path. The controller needs a binding so
> > > platform Devicetree files can describe its MMIO region, DMA IOMMU str=
eam,
> > > clocks, interrupt, DAI cells and per-interface AIF configuration.
> > >
> > > Describe the single register region, one EE interrupt, the required G=
CC
> > > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interfac=
e@N'
> > > child nodes used for static PCM, TDM or MI2S configuration.
> > >
> > > Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
> > >   support on Qualcomm Shikra SoC
> > >   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-=
7ee6b5f2d928@oss.qualcomm.com/
> >
> > This should most definitely not be part of the commit message (which
> > lands in git history..)
>
> And internal review (by tools and/or by people) would tell that, so no
> one ever reviewed this internally. Neither our internal tools did.
>
> Best regards,
> Krzysztof
>
Addressed major comment, will be raising in next patchset.
-Harendra
