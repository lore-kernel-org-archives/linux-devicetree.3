Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162F3DCD9F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294553; cv=none; b=t2PW8b3e6DQp7gefFj3V8HH97X2pkwdyFpJw7QM6w6bzivGObVXvYbCwy5T2rBT+NOsTesAAZsHK5XOc1FXv2NSMFlP6U+gBqK70SIirsaKIpEto3URshQ1HLgGEv8vknH6npDKukRP3TMVC6FqogZrjtOl5hrKSg3LyM3tsULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294553; c=relaxed/simple;
	bh=guKwrZEYvB5h2JRruAj/qRVD+1cfikuiDLMfNbEldiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScTRnkn5QKLIVMNfYslxPiKV1nPh/mHeJEm+/X1FIVmjgaBPJsRk+XXE7zkq5mKu3vJfIaBpWmEakhuyknvfD+DTqAl+hPUkMVF923poKqJdpuvyxyGDQ1/xgRPfypixpSRTc8Ne4lFpZ4HwceltNiotJ+A8F0sOS79vHrJUtXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8a9Qk1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=embpuFkg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8a9Qk1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="embpuFkg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFatd963772
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bUSeSLkufQVYtp8EUHyZA6H3
	W15KD1f1Veui0HYJlds=; b=X8a9Qk1UgXPMXI+4yNaim+sV9mWAN1MGIsGOW0gB
	nOqUYN+coVA1beMx/Oz5randUXeF5OIE/Q1dYTLaCCJnvbry7RvJGJj1gbTo4pMQ
	s+VhLdXx/Y2fEmJ0L7MX2sW/XpMeG/slgziMF7n/U0u9WfTAWuoLRFw2kHdtl/3G
	A29KHT8+bu4NMtcE01+4g+6ep4GgpiIgtjUMe+9K4FSVyZk3U2On6ncoxwmWWF1z
	GTO2hMsYfpnf9rfR5GoPq2I9GSj35rSCx0Ozm22I7rVAhnanCUazY5MTrHJri0Da
	T/B0CRC+1Cel4zDBQ2wACLZuSQAFmsuulX7m2uMHB8ZNqg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0k5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:29:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575427e5360so5102186e0c.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294550; x=1779899350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUSeSLkufQVYtp8EUHyZA6H3W15KD1f1Veui0HYJlds=;
        b=embpuFkgOMFWIIPgyYe68rR1ZQ1oxEvwPN3ZJNgLz7EjIVTZ24ENmrkLlCJUVN9+g6
         obzFTUjv3V/K3jcIAG8bEe+SwaTagtX7Uj6iH0ppgtG4e1zdN6e01pD2+FCWzSMRPcQp
         9fe822+16ke1sJKo5chOLChnBTWm+4GYKSandfs5w45R+f6d8C1F5ZprxJBfD237ucGL
         ENWkH7/VbYjahxuKbWnhf4/UeAIduQYcKRDZFrVsesmEPeR5ta+puqBvwwx/riGfOj66
         T0Hvui/4otySPOnefPXDmpm1QjpYg//9FcUfQt3LaZ8G9zbbkgNgG8gL2c6ycmTOuiAi
         PUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294550; x=1779899350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUSeSLkufQVYtp8EUHyZA6H3W15KD1f1Veui0HYJlds=;
        b=iDkDUqesyAXJBBjPZDhhxMy4QmTS7pERxxRw+QHvr/CZ9hTNp1huljOB44HY9ptBHk
         QOXmpBb+0YSdJ6IB7XSceL4KtTSeV7MobzyhNJ+0KufECkqDDzRyiM5d5UkB4jRZ1hVD
         Ofssr+3s1cqHymQ2ARzXi/j0c2rJIYKkD39EnpyAZ64Naz6/dQsck0bmMEDQ8BjFckW7
         AmU8UQcZr9XBcm8DFkcRwkxDaamNThUSV+GnGfF90Yqbob2un+TJiU7aObwVvA7G7QLC
         Nyup4zbJmSsDyMGK08tnTADBckIcmHhqFehwyQyG07nyv1kkWRMvVi7Pl2IvFAdNv8wL
         srMw==
X-Forwarded-Encrypted: i=1; AFNElJ8mjmYbvjh0wIhBAhfgy1pxxuQSCaSbzlufnCDsZwcNUuYi5Act28zcUQDwfCeTZ6QOdhjHCubvxzzt@vger.kernel.org
X-Gm-Message-State: AOJu0YxoQC2vrq2RPQP3aJL6A3cCPM1YDuwbxiW+piWL00OEhBlmHh5o
	6/RG+ad9Tbk9IlOJhdCth/ZOUun7ImWs2CuWOJk7RUi8ZzFyM94bTl/k3huhSnWUKJJD0RbBTG+
	MqXZvQjqVzxh90p17HHEB4svX/ibaUdj36gq+1Yn/AHPGR1ZdVQrPrbUwPGPCTBzK
X-Gm-Gg: Acq92OHFvsWMm16AklVGNofD3ypGVg+Zc9rw/QDxBQsJ132AfL554qekcXbUoc10YLQ
	xmsS7hsF7PJJF54SkhXUAx/SxzSjoAjmwHVttov+6ePpw+gliCFEkuvu2cjQc80w41wTDXUqDj4
	AejontEGgrrwgr1XYWCkTNWm1FFGY/qQgR2b0L/JV95cC4fnFAitFrOVbtjrBp7yb+mnyXldfQ0
	1nwoslsRTnx/GNKc/gxAMxMuJrNkedH8Y/V6wD/yAjQ69CeTqWAX9b1zJLuk0v5Oto+CY7K7ZNN
	FSjDrOsQ26lmtP1DzLWjRprpgxYaubdH5JLeudyP2j/4co2GOgF4yoAZFEvRXKaKqW0XuLm714S
	PjMll3gco1C+y16VWi0MEkzSidjYh7Gr6bgzab/770Zw8A0jlboi3xaTdY+aV74dxdMz+8V3EnX
	R7rQ+GzJf9OVJeL6t6sgbEkB7gDsuNYkh1C/A=
X-Received: by 2002:a05:6122:d15:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5760c013206mr14705270e0c.11.1779294550513;
        Wed, 20 May 2026 09:29:10 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5760c013206mr14705226e0c.11.1779294550062;
        Wed, 20 May 2026 09:29:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm5061603e87.79.2026.05.20.09.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:29:09 -0700 (PDT)
Date: Wed, 20 May 2026 19:29:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
 <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0de157 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2jIkRjB_xXtrPJ-GUZgA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MCBTYWx0ZWRfX0ftGNILBM6mv
 yBuMWjh8gEhkDyJuzmnq9aMTXx8bGjP2PvMyUPMryb4ww/7Nezw2wk7wSN/lRlPfmDB/BtAyMHz
 MeilK+Ux81XfDt1Q4X00MZQUwFfMxNRcBKzFfFsthAGcbhchNx02lfYrkF3tMyhP1KQcF+XmAkM
 dMkJ7gM4gFHAegjGe9dZhJxO8zaLmRJ4j9NJEFnRtKS30imB7GEOrxkxuOFEbooZLRgZv2ufiB+
 0ycE0iYFJO1GdX7jhJR7HYvbV9/2KmfXJJBocQU8SQaYeDW4PMnDbsroPzkZFmt3yBqhbnuHr50
 c0rQ1iPvFZEuanPGTU7RH+tH6wL45xP/zkuzuqaf2P+TFzZ/+Yg+b5MLg9FeT6jBeEX5T760QPW
 6Bs3JD/t/PRDyqStKsl0T0wrAdrcJbXdJ1mC4iIKH+cJMtaiXbgGKkRskuDagPdSyy7VZ6fVh6V
 LCgGnN465kx171iN+Hw==
X-Proofpoint-GUID: NRT6DhKqt_IOOyc_SiVF01bx0I1gXSNv
X-Proofpoint-ORIG-GUID: NRT6DhKqt_IOOyc_SiVF01bx0I1gXSNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200160

On Tue, May 19, 2026 at 09:34:09AM +0530, Imran Shaik wrote:
> 
> 
> On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> > > On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > > > > > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > > > > > 
> > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > ---
> > > > > >   drivers/clk/qcom/Kconfig         |  10 +
> > > > > >   drivers/clk/qcom/Makefile        |   1 +
> > > > > >   drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> > > > > >   3 files changed, 576 insertions(+)
> > > > > > 
> > > > > 
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > 
> > > > After comparing the files...
> > > > 
> > > > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > > > clock-indices, but I think it should be fine to use clock-names as a
> > > > one-off.
> > > 
> > > Or we can convert it to use indices, since those are stable for agatti
> > > too - the names would remain in the binding, just unused by the driver
> > 
> > Either is fine for me.
> > 
> 
> Hi,
> 
> In Agatti, apart from the clock-names difference, I see that the AHB/XO
> clocks are not handled as always-on via the probe and instead rely on pm_clk

There is no pm_clk handling in Agatti driver.

> style handling, whereas Shikra follows the newer pattern by marking required
> CBCRs as critical during probe. I think that attempting to modify this
> approach into Agatti may introduce unnecessary complexity.

Well, you can start by explaining what caused the difference and the
result of those differences.

> 
> And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and
> updating this might break the ABI with respect to bindings, and DT.

You can add Shikra-specific bindings. See how it's handled for other
dispcc drivers.

> Given these and considering that Agatti is already stable, keeping the
> Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of
> regressions and complexity.

I think you've provided arguments for merging two drivers. It would
allow us to modernize Agatti driver and also to make sure that both
platforms use the well-tested code pattern.

-- 
With best wishes
Dmitry
