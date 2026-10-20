Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487054;
	b=kgT3fVcc43eL3BvnFCyEj5IDEOH8ErrJiw+eFP8pwRfSIIKv7y9zG4uSEHwmCX18Jurk
	 5tIPgJN4CCcx6qaZpFpIeKbuMPdkWldJf9onX/sSTSVpA7BpV0SqROqBxl6DVmowNM763
	 kJi5y/ONO18Q56VNhIU5O3wpbjGs6EyYuhi3KL4TCzHj4dulDfYo7gYebtiCeqDayGLWj
	 dFkeADFJX2xl7IFl0yHhZqqbpefAHO57TRr6m4f7ZPfaAn7k1AQbYhNzULVx/NcaAzRtc
	 P8jgLSzixi0Upn4vQm2SYIrUxujn5xZ9CwRh88E5bf4k7N9mT0F+MjyJXgz10VlG2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
	b=t+j9RjByIyehT/PC2asAjAyy73N6XR7hNUF8PkTWvGaX8BJWvgfrkRvu6UqckODEwHL+
	 2z9ZMzXNd2uNgJtH+PXUnblQK5YKd6Uw1jfc4vg6cInQncECW2ur7dySgv7b+r2Xwc3Gh
	 dQjCFzgx0GeCJXFoHyl7BiOrw4s3sdXhPMMwjqMaWZsK8fNVJ5B97bYL4AjEEgvUCwEAk
	 /T/j1AVAwRIBHVbo2fIqewo7A+h2I8gXggp3jBM36vfRvq5cnAkWbKAUhw0qCzYuX94yr
	 6ZCsjrG1g44yztz7NkF8Z1IJo0gOjCbohld0EaKoBUeJ4qj7PXCaFredM+9fUXvfm0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6B606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED6B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8HfSg3807111
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzX1TW2NwI+yWssGoHbGc+/K
	6ykZuk0NhVu5SB7QmUk=; b=CP0BhtAmyCT6JyLAkmqWdyIfIqbOfM4Nfxl5Nrdu
	KmRJTmyZosrBtw/iaRX1wdVgSBjVPmUIMVhWovX6ncpqb9k9WXXADINBVivRrH0q
	TbLtJ84eSTo0UiODkhGpq4usdA8zwPF8z83+bxw26VUz8YVWBXoT4OUEyYGJV6Hy
	OgFc1mR7lwPS/vEnfHXLIdHIAO3H+a5M657e0Cav7BGQx7B6qT0TPsmMJxpLhtty
	uuZHLlvmiZB+dNueEAJs3pxrSQyBMvj80JBx9FHzhsiKpg8dHXXPrNyE39DliMTJ
	Z3DLcT0g7H9c2ntNhXDqgb+0OGyskd802zcs65EcThsnsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9s1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so676230385a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792487052; x=1793091852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=bSpvEH87sYF5X9Do9f74ghqyunqFSAT5x2b5vT7JYTeuCIK4yND76EmlHKuX1E2t1W
         zdLOmCaCEg3BctVhP6zkJ9NubH8p07JZ9b2DYi0qkUr/GjauUelho4ssezuiIst0asKW
         AyqeSqy+e6mGg+vjewwHEEH3igSEFtLtgvRwEBRnckY9aC2P13f1QywEVoQZlAWJToZF
         Uat9pTO+aVyo+JvJxYMkiHXYZw9F/qYijHVa9nfwZc0FWs0001yyhPS6evjhaLX94B9c
         nwG4AtYlpOachqr4KjTuycuMZTyZY2eKMz8/qUnZmZGWMfv0Y8MIoPoahAGcKQNZkrJC
         CWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487052; x=1793091852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=C64xywz9IsrRlVjPrAsyL759FP89omlM0f7buP+s6eyNT+FiepWwKxHakXNkmYyAqv
         7A2ZVLp6jbMHVJ9zXgFH9Ur4Ls/B9YAYlXhmrPbhrjQBAMmaQTvgMRiH9KzVXdS3zLoW
         7cfOLe8K4ly26JqSczZJeNp6peW+TPNkCLVX0hS/cIfwqwL9Ht+q2zeS6aE1C6g4j6z7
         85M3es2XvPWVB4z/B5N3HHWLmLqHS+UVpCYebFIQpMPz/Jm0NlRZkriyDYt8SNoRXEOT
         miLZwS6EemtS0RcHLbVYWd/46ZgDttVrlxgYTYwPlyVn+xMMoj3EO/ksY6T/av4qEyz9
         y4Qg==
X-Forwarded-Encrypted: i=1; AKwUvByAbYf0XxXUxq7lav9qk+Zjl9jzI0tuWxoQryl9P2awyR0Gaw/YX4tbB221cLh7ZHUb6VIxp4lzcr0/@vger.kernel.org
X-Gm-Message-State: AFq9FYKiI/Xd4BFOOqOMllX3xT1a932w6bFdMHrQ1FU8bi1DJ2r4UL0E
	8vcX5F4Bk/ErINN89IhcO//5t9QC1z/jfYHvoFkk2yj+sxTk35wWu6gjKcyADGsjt0T5SykRCo7
	HSphf29YOHaUA+cqQPM/a3X7o/qcdkNh9uzmI810mY7R2v8uHuFV/lk6VssGAU3aH
X-Gm-Gg: AYBFou2lnD3VAFLSR1bSjYSrwPWd9mS9YJ7xDBOMs2eHLuY5MprZKNz7Yuw7PLOJ1J1
	t7SPfDdoAk0zQbKllqhto1/dT+cnhjP/bCAc09BjH2rco16FaB8l5OnhepqG6z53kPRYHUjDwfv
	T+vnEJy2XgBymcuAdVegj0ur5Hzk7LL/FiFd4Y2hFt/HH7kzDB9E0V0OWPeGYrfEpvfj/SM3HDv
	CmlyuX7NOe2r5+yW7VrAY+LjPOIjU2cssT5JSP4JdK5VrOpItfcu/kmrM6sAMH8yhIhsdVfLTso
	WcHGVFcrOoxb3yk8bnVpaukpch2H0PjCm1N1DyZ3P7BC8Dgh7Cl2chX8SbZtiJqnV5/jmk5PDaz
	GW4TnvsRjaoTjH3E2t0yik/JgsVaYJEAm0T3JYHY2D0sBXQHGWLbBWBPhlLCtKx77U9d3w9CFZI
	WmvJtu4+zg8sJ8
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724722285a.2.1792487052072;
        Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724715685a.2.1792487051406;
        Tue, 20 Oct 2026 02:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2531830e87.42.2026.10.20.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:04:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Message-ID: <vs77pfhgismmyrx4ftmsrl5hylwcjpxirnjdw46c6wu2jcvczl@4wbizp5p247u>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
 <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Proofpoint-GUID: cs-7H3JTfHoZ000iIsL_tV4igWu5Nvll
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad72e8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_XvO8LXBJ3Q0iDersrIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX+6uvuGmLEleD
 46r0wnqyKwJVZaEHZagT6XCru7Y1kS9Rcm0sQlad5G02DEFrIe3RwoqRiox2LFIDhGu0dhKGIrK
 KiTR38kQ0J0r4RNCWoKqJhmyZZJbyubTWJfFj4RPlF5FB77UqcOLBQPLWbPhMOMhK9Ud1EVW/tz
 QvVd6mAP5Py8QYDA3bcxEtWs5M5edmLiUk2ZVdU7RNvgKCovoes/13VoxiNiQWmUYVFLG5XamcJ
 8rdQ7JCNzANx1NQAK6igGUPsZ0uMK2JY9H66tTUCoS7fbDOa0L/n33tkkwiGYsqyF/7zujuv+QD
 IvywMPq1+Yu3EK8noSRYFQ9KLshk1Ifd8jzu/ia5EOdIEImvqGLLLdHGGzdDkw1TF/C2hFdwvwv
 2l9NJplTz5blYBHmYBN6mM/gHbrODMV9N5nEHg7No6a2bXJM41KC+6sTGM3adOkuTcfyQyRT2zN
 s4eTbc44a6o0BM2TZaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX7ItEV0VsF7hJ
 0IH3d54eQ4RQ7f6mCuIs7IH3V1ywOeJ5ZPD9+ivVleDjqG0C44rlIsZiH7ICephmy3uOCvyh6Ue
 gml+eboYhNxuvdMM/eb+al1kv+/aLCo=
X-Proofpoint-ORIG-GUID: cs-7H3JTfHoZ000iIsL_tV4igWu5Nvll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On Tue, Oct 20, 2026 at 10:35:36AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> > ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> > unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> > cannot leave halt unless mmss_mmagic_maxi_clk is running.
> > 
> > Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> > and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> > because there is no bus driver to manage them, but missed this one: its
> > siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> > mmagic_video_noc_cfg_ahb_clk all carry the flag while
> > mmss_mmagic_maxi_clk does not.
> > 
> > Mark it CLK_IS_CRITICAL as well.
> > 
> > Note that the halt bit is truthful here and must not be papered over
> > with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> > silently resets the SoC.
> 
> Will the right fix forward be to grab a handle to all of mmagic
> for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
> a workaround

Most likely. Some of the clocks might need to be removed from the voting
model at all. I'd say that it's a separate set of fixes, possibly
affecting other platforms too. I have it on my todo list, but it's
long...

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
With best wishes
Dmitry
