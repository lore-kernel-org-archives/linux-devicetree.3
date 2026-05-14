Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93213DFC6F
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764181; cv=none; b=Em6YxVMre+Z4ASTP4YoI0Oeq/aR1cyU5E9ipSLpIj1h2H5DE9mQh+3reQTh9Cqjup0Ub2Cu9LKawtetUgZAaLcBXhndt8FuQWCSNfl54IdhSAWtrwlh2ePDVuxvJeBdbSrLPSa44K+FUx5FhxcvVnL+DnzmPqpPc5nO5P3n4YMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764181; c=relaxed/simple;
	bh=PMt/S965DBrZcSHo/mx/GlpkYgz3KyfWQCDcoogPVDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ozdnw7DuLRqDYyyIP+K1H1oXq54bSqDsFC5ac8NwzyAICn8AMKadP3pyz8ELlCM/QHIuMVASdTI598QQq/sLEVDIoIesZKAn5/xzHOLIdG083K7O5VIi+DsrK0Y2AmpNW8Htmcroa44vxrrJWONow+feaSOmz6JRpTmv5FlzKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNxWrG1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCEEhg+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNxWrG1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCEEhg+c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYEq2238425
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TSEOS7FzfulIGgplAzzxDVRV
	URGWpeZGkmEG7M0BRYc=; b=TNxWrG1V9cFtHOA7GwVrqbitOhhxXQaiEqWg8fzJ
	+sLGVdUfUGRpvq014GRvN/kRxViA1KU/we2/9roTmstiJyNK8Z66EoV+I+Z8pMho
	yXtuz3V7i3OejWJFlOJv3FqGo3BxoNP9JX4aAxp2FcqsfJgQaKfaOjwDm6uKMhBX
	qI5K8ZS599kSIKbvIS61BMYrCMmR2HsQulXCvi7LzV5wwzyezyH+/yMHNvOQleVN
	ohVmUNdeB8j1zM7yJVfJB7u5tGm9IxHq56tFrmMmJEHSlwnzPjd/byip2FqdRrHO
	onjKWmlU4BWLCglZIABsJr5iUfrnaDqGhDii71DgMDiekQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhuwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:09:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dc3d81736so7157784c88.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764178; x=1779368978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSEOS7FzfulIGgplAzzxDVRVURGWpeZGkmEG7M0BRYc=;
        b=DCEEhg+cI8unhMsP0GySKm/3XTNGCcTzO0IGIz1TAh4Wcl1qUnsJR6GTIy6bV+/cC0
         XQVagVIDJ52K/TAGMHxg46Zmdq2v0GayO3cSG0Jv6ofzHCEiEK0adg/lad3tt8WSqUXQ
         KsLYHEDdMThkNZIKexJZCcfj9Yq02AFQ9MdGdaEA6ezHxQSvmyKIgImPAIBW0nXMezS9
         bK833jp6XJdH7rljSDICiOGXWtWHOeSl99p1ZnSfu/ASPLgUEw5bp3PgzCEWI3nWPYvx
         I9bjnoDUHATEFzTFbNdJ1NYWoCSgRCcDQHM7sA7HAvLV45lJpCqlyw3OR/Wr/HBOgb0X
         qtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764178; x=1779368978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSEOS7FzfulIGgplAzzxDVRVURGWpeZGkmEG7M0BRYc=;
        b=XlUak6c+G1vFJrYArR8p7hEOGHAqa0aysneu7N4SbNsdA2Al86DTchSgeGnMhBJFA9
         MxTHcZLsfGwhK7boMhSVhFT0foZA+xRX+I8nSe+zdWgROk/TKPF3OEn48CT7sklKGl8Y
         bYa1Xq9tw7eIdNndk8Vqoc5EQ7Rim6hcfLaMZPzwHF78aS6V+cc8CwSirH36QqgFK2+K
         7D4MFAMLotcTUJrZPtKfW9yvFW2nVrPuyt3UA5QVv4CDdtCKqIHtfX1bCWXfXdBTXSL3
         MiZSuhBrEOukdCbl7ZKa53SIixrRoXg+rIx85melFshU5iWz8IgGgHtTXXYJt/0QtH3v
         MDdA==
X-Forwarded-Encrypted: i=1; AFNElJ9yCG/MjdXn4yRJ+8D7y7t36bosvyA+/oU68GQ/ycFEqeY840Dz+Vyd3sPQg2GgfDc5e+iSk4rzoCY1@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTPxf18LWVttdIwT2bA1MBqXOi7wLz0bS65loFlj2S1JCCDay
	yzYP3jFHovEt34jtv1trdiRn/QIXIMTEUM5VwYf/Nll5J8QGSJc1toI6lv9tR3ISRvfMrvY5CAj
	fz0KdHL22Xpo7Cj5bBrAxwkEr+Le12xojPVH1HbCOwH448RcaB/1p9jU/cumMHAgo
X-Gm-Gg: Acq92OEeq3MiqHv0Yz8+6wz6QjDUO8o0dTtesV9Or4L1aarNgg1JMa7p5khLP8C/NXM
	xoJFPjJjdx5hXOHj+Yom49pYjFZwfAR4VYMrr2M+UwM1NHic/6AMcb7ZK/DOZ4rSf3+RPXOtn9Y
	1UFl19T1hBpyQv2HDTKJylPhpG+hFxF1AitQHIqoOl/wfT6aBvGFDpJS3+Ntz18u1ZdqzQ9cZpG
	foXRaRpJaEsxwNgEOHVfaRJnYkcCKEmi9a6UPRFw3VOQFgiPhVi5VIQISpvi7nWlwoPOdTiEGEk
	byB8NgB0yXmmR4IRQk1wmhjaEnvucm2ria7HeNPpOwRoPuh5SKBuj+CQ7u2iveUwcmhG69nbFLB
	JJeq9ptIIPC/dG8OF9bFPA+boMVVILF7hT3EyLvpuAYNfKLgT1WxhrCcZfvEX/P7RudS+cCbZaa
	E=
X-Received: by 2002:a05:7022:1a81:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-1349a6f91b5mr4300106c88.1.1778764177520;
        Thu, 14 May 2026 06:09:37 -0700 (PDT)
X-Received: by 2002:a05:7022:1a81:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-1349a6f91b5mr4300067c88.1.1778764176882;
        Thu, 14 May 2026 06:09:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351d9sm4393185c88.9.2026.05.14.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:09:36 -0700 (PDT)
Date: Thu, 14 May 2026 06:09:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Message-ID: <agXJjhDdsZE4VHAE@hu-mdtipton-lv.qualcomm.com>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
 <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
 <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
X-Proofpoint-ORIG-GUID: 5dOiTi2k2exsWKGnX74b6gpSkf8ffe36
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05c992 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zvVpzuEAzJinQkndZGQA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMSBTYWx0ZWRfXx2wjkr/uTCTI
 yCZQn3utW2Z/IvyP+IcRcGJCnNpK423tcgHNqkLNyIAvkDVVUnYAs1RHWkPJYwjYeaLZklCtrZa
 sGShWrIDgibCCjTnzFtUNKiJbB5M89YHOhgLJHZf7op0CZvF9aWaqBp8zbJi1lnajDgW2+nx08V
 x0zqDhysFX7xh3C8QfweAvIg1UFqxH2IIlKU7CRRFSx03IGKgdExumMyys4kw37v7QwmCcBQn6i
 fImlOuSnvuNjdb3IVGHsxfB+0UBdDvv3kSj4zYRlfyBhfP2pWaA90+kAzfCrCJROV3Vc2E6HC5Z
 /5UB8xqdH3YDBtDHy8Xb6OceRcEQMwz2VLRXf+Jwm52SFoLFvTwSxoodbyDILoseIC0CmAasJS7
 QxIcVY4QtcmkZcHx9dYxUCHXpUIz3t5V5d06UMzEBjhvwZvclAyNYA18ayWRRnc5Ff4jUY7qkVZ
 pnCrMs8IbHLBJTUOWOA==
X-Proofpoint-GUID: 5dOiTi2k2exsWKGnX74b6gpSkf8ffe36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140131

On Thu, May 14, 2026 at 01:39:24PM +0300, Abel Vesa wrote:
> On 26-05-14 12:52:21, Georgi Djakov wrote:
> > On 5/12/26 3:18 PM, Abel Vesa wrote:
> > > The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> > > node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> > > SDCC1 interconnect paths can resolve to a provider node.
> > > 
> > > Bump the qsm_cfg link count to match the new entry.
> > > 
> > > Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/eliza.c | 11 +++++++++--
> > >   1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
> > > index a4f7903f0524..6d12a1c3c034 100644
> > > --- a/drivers/interconnect/qcom/eliza.c
> > > +++ b/drivers/interconnect/qcom/eliza.c
> > > @@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
> > >   	.buswidth = 4,
> > >   };
> > > +static struct qcom_icc_node qhs_sdc1 = {
> > > +	.name = "qhs_sdc1",
> > > +	.channels = 1,
> > > +	.buswidth = 4,
> > > +};
> > > +
> > >   static struct qcom_icc_node qhs_sdc2 = {
> > >   	.name = "qhs_sdc2",
> > >   	.channels = 1,
> > > @@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   	.name = "qsm_cfg",
> > >   	.channels = 1,
> > >   	.buswidth = 4,
> > > -	.num_links = 29,
> > > +	.num_links = 30,
> > >   	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
> > >   			&qhs_camera_cfg, &qhs_clk_ctl,
> > >   			&qhs_crypto0_cfg, &qhs_display_cfg,
> > > @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   			&qhs_mss_cfg, &qhs_pcie_0_cfg,
> > >   			&qhs_prng, &qhs_qdss_cfg,
> > >   			&qhs_qspi, &qhs_qup1,
> > > -			&qhs_qup2, &qhs_sdc2,
> > > +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
> > >   			&qhs_tcsr, &qhs_tlmm,
> > >   			&qhs_ufs_mem_cfg, &qhs_usb3_0,
> > >   			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
> > 
> > Should we also add the sdc1 to some BCM?
> 
> AFAICT, it should not. Even downstream doesn't add it.

It should be on CN0. Downstream not adding it to CN0 was also an
oversight. It shouldn't make much difference in this case since CN0 is
an on-off BCM and other BCMs along the path to qhs_sdc1 would indirectly
keep CNOC alive, but it should technically be on CN0 just like qhs_sdc2.

Thanks,
Mike
