Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DA3F4119
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787128; cv=none; b=Bp2/8akeqm44sO5pb6Al3vJmi+1pkCb5tLomZPiuYb/xkqTaocmhOL2gRBpEaFNA1FTuNh1at0r/+kYeBLkwMygpusOoDC+4tihtiU4Lv5H4qvYVOgKewGpDrBhD1gKJjVjVO2T/GKSeqz+1PJvkO2bD76CwCXj2GVi6nG7vN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787128; c=relaxed/simple;
	bh=cy0s4uIYXW0ha/Gtf/j47OjTumSz+fHWFjZCUGlXhmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0jKYq/MqBnnQ1pALkYfm3S+LCFe7+Tg48S8YRxuqXKznB4VQ1H5I6BQhFO6z17thwVFzWsUgoalijnr2G0AZuL3iDkrNbBdIDxeJQh4lfKO4dIbap1aQrKa2DFXrnR9C9GWCjgyoV+BgXrzCnomXZmnZKYHJYodnSap6k2UjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTNSQahC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7nlX9jm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTNSQahC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7nlX9jm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpvpu719635
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DIW1PTso37FN3Q8DZ5BftMaC
	OZsdLplMWdxzm3zETHk=; b=QTNSQahCyjD4wJcPfVC2PAMWJQIm/1JQNZMz5Iil
	lfbpCp3zHdjP4BbBPZKRqq2kbCNuIOoV+M+yK5yy++uz4iabFuf3fmAV+XuHbJcp
	lPvh3QBaT/ooURKgBQ3JEZcCxt5a4dz2B1DkhtR/PlIrQ9YkMmeV6oVEOAuUDQX6
	akl/DwRDySJJVAkT9Kwc958KgW/1ZRwOUOqV93vAK7ek7NP09qto2gZHiPVJeH8+
	pmjh718UvnoyTYQHG/YhCvu/tHdqa7QIJMeyxYkFpwIBiFPAkstwZ+Qj3P3TiIaG
	aXoB4/tMvpOsp6SYdXL03h4rjrxjeXZU9l/rubysHn+yKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1x041h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:32:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso145600a91.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778787126; x=1779391926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DIW1PTso37FN3Q8DZ5BftMaCOZsdLplMWdxzm3zETHk=;
        b=E7nlX9jmtwTK3Zh9RdpVEK2ed0FG9o+XhjQ+YOza4oomCHRCGSxhDL8Aon0ZApNK6p
         ePbLNxY+FzAQ3RXjgj3uiW1P1dffZGNyfZ42/9Z+uvniY5diSZUGCcsNXGbxZ+36n6mw
         avMnZuhtS6CRuzI2vnuh2fSG1Eeo/N7BJhqDYVa9hmqqQH7dktKkS8eyv9sJ3lZBiiR/
         kPKQuilg3Yf8aIt79C5ZDBUI+bJea7Qs9tkmSm+w9Tkv2lt8FBolZIgZPVOpsMNtCmR6
         jg8BVUIS2Rfxf2G3R/oy2PqDdbWhqVDyYtrlGcxpTmkDHjpGQt9V0G/OKTpn+FDGix5x
         vShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787126; x=1779391926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIW1PTso37FN3Q8DZ5BftMaCOZsdLplMWdxzm3zETHk=;
        b=G6o+J/yW3K5zDKwb4yXp/3f7bRM3oaD2ohFB556pzgcOmzhswO/DxraOzxWFjIa3dD
         akvm5uaKXtXq3jOOhX+6wAOeQFWw+tneqrIoq4IZZYQ7Z94sR0x9P+hJgaTTa9BwWoVg
         zkxgELqPd2xAn0V1REUwyXdb65rX67+jEGTs4M+Nflp2wwEQ8sbIXa/HUAQX3eTPCA2o
         6FYkhsy9VzvvgV46W9j6ZkW0BCq3LvMnn2OUYtDYAafsPE25EWH2xQK0qybik9QhDooV
         bps9GoJfIYwdDoqI/l5CuzXFDO/cIUK5+rHUXJCA7bUO4CZd9wtcOGXPNmjNecnZQOU7
         jl6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Volm2fViqeSdXey74YBqsixDEHVEIw26srSo1RDjI3l4c+8/gmRkSbPLAj1su+sQzUcnyo99klFLD@vger.kernel.org
X-Gm-Message-State: AOJu0YyqL8i6QjcrASxPpMZUQ5CIitA1S4gKLjoUYecP4v6pNyVG5fbh
	WqKSHrZAaMny25H2CSIwPogkqbnCfVZRSNLN/SCIvce3mVimjAX03yrJK8vc6xIEPtykQ87bZrj
	gJYJgBSEsvo/qWL/0WyCG0GBCichBD15szEunN4wadyMQ6omCUwTrqeNepMqmFoQy
X-Gm-Gg: Acq92OHZjPtTvuOrrOMlh1tysQfGeTvGxpq9NmVEzS7UCC8ZtxC2pudkTPHK8Cvr3sd
	8iVV1hIIWGQcHR6CK9BZMhoIgoZEKEwDcxcZ6jRCbAI9Ib7oDBa3WW+8+u/J+UcNplmwbeEGFN0
	2xPEqg2cduFv76cWRjaAP3uwKKEywraSIYtc26YTzLr6WQVC6E6sD2pEMWxBzYWdL/wXKS1j3Ic
	T+iooRtr+M9IctjD7A8x/huUJ2z3YJNZME8dpNzKAP2vY5DFrNPUvBKxDETKYLsk6er1Vn8/OSr
	y5q2UHTT7RVYifrAZmWOV8J10aFRIsRCUOqgK0W4Xb+6XoyI0vVDrB3OuW9q6wNPa8ae8PotCYI
	u1pmU0NrMqxnaEJXK9EE8zlusKn7cuqeG9j7yiAyRDrqWaSWLST5FaFTWx/PomDOOdsNky231+j
	vRgw==
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr711114a91.10.1778787125543;
        Thu, 14 May 2026 12:32:05 -0700 (PDT)
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr711093a91.10.1778787125010;
        Thu, 14 May 2026 12:32:05 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692aa3ba3dsm1484806a91.8.2026.05.14.12.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:32:04 -0700 (PDT)
Date: Thu, 14 May 2026 12:32:01 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Message-ID: <agYjMZX/cYijEBOm@hu-mattleun-lv.qualcomm.com>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
 <20260514172151.GA410819@bhelgaas>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514172151.GA410819@bhelgaas>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE5NSBTYWx0ZWRfX7rCo4P3gIopl
 DeMeR0ZI5vxCCIjoyLuTed11QgxCWb9EFboG2Laa0tx/+Di5dVv6q1WCb6qzMzLdn4jispmChuf
 rxEP6m0f+blPeAQ7nbwuXYKsE1BlCFFejc8PMPHJJAnJTMrJDSMCFzV+FIqOva1ER1qJfFQyTwu
 eF+lSxGYbK/bfZYSSvQwWUMBPaDqWdj4ceM0fiQ96tmmI+IcyJn5p/wriCQHrgyjc8AcE7qcemA
 wx2Ll6u88YD/NxRelnkSJFG9zYezZXes2B2jRaxZ9DfcXhJzLSmx92Mho8RmuE+IzHRPnpUEkr+
 I+tKrz8/dBPntiEFsVIV62kRUA/uZGTo8vEh94c8yd8z6CJ4FdWBLgIcQxr3BxHNQLcMTPO2/+l
 o1VyfA9EO70TN6y61VhaoygHYdZerXuWjeDOcLz2rA7jGjJ0tpwWnGLjP6Wi5G2uhMEWzrQX+0v
 NUKhMISKZrISo84UyLw==
X-Proofpoint-GUID: 4yYJqucoDCqrKojO27oFqmAH1KUGVcaK
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a062336 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1ED3lwF0aQ1bZmQ4pvcA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4yYJqucoDCqrKojO27oFqmAH1KUGVcaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605140195

On Thu, May 14, 2026 at 12:21:51PM -0500, Bjorn Helgaas wrote:
> On Fri, May 08, 2026 at 01:02:13AM +0000, Matthew Leung wrote:
> > This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
> > platform features two PCIe controllers: one capable of Gen3 x2 operation
> > and one capable of Gen4 x1 operation. The first patch adds the device
> > tree bindings documentation for the Hawi PCIe controller, and the second
> > patch adds driver support by enabling the Hawi compatible string in the
> > existing qcom PCIe driver.
> > 
> > This series depends on the following prerequisite series:
> > - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
> >   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
> > - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
> >   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
> > 
> > These dependencies add necessary headers for running dt_binding_check
> > against the binding.
> 
> These apply cleanly to v7.1-rc1.  I suppose the dt_binding_check thing
> is the only real dependency?  Is there anything we need to do to
> enforce the dependency when these get merged upstream during the merge
> window?
> 

Yes, the dependencies are only needed for running dt_binding_check as
the example dts snippet would produce an error on the missing headers.
The patches should apply and build cleanly otherwise.

I thought this check could be a problem for merging so added the
dependencies for completeness. If the binding check isn't a concern, I
can drop the dependencies.

> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> > Matthew Leung (2):
> >       dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
> >       PCI: qcom: Add support for Hawi
> > 
> >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
> >  2 files changed, 189 insertions(+)
> > ---
> > base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
> > change-id: 20260506-hawi-pcie-f61435ca420c
> > prerequisite-change-id: 20260316-clk-hawi-1ad4cad36d6a:v3
> > prerequisite-patch-id: c4fbb0620d748d7f1ee675ade5167775bd31c8ac
> > prerequisite-patch-id: ae5e212518cc333a1a93564cabfc6abd128df664
> > prerequisite-patch-id: 3c3816e0d595589fc02383f10e48c83a61fdc9d1
> > prerequisite-patch-id: cbc13fb819d1c1ee77957393f0958f05db8db864
> > prerequisite-patch-id: 17e2c0cfbbea826fefa1c67d0f5dc2094ab73d76
> > prerequisite-patch-id: 150dc74750377f4558deab6b179632872bcbb71c
> > prerequisite-patch-id: 38fe0da5b18610aeb32c7154f9e50187ccaec6a4
> > prerequisite-change-id: 20260311-icc-hawi-d6dc165f8935:v4
> > prerequisite-patch-id: a1ff655f0b21d6259b158ad9f99a95bde31257e6
> > prerequisite-patch-id: db21b6b20451be8475129faece7ef4191d41273c
> 
> I don't know where any of these change-ids or patch-ids come from.

These were generated by b4 after adding the change-id metadata for the
dependencies.

They should refer to the change-ids of the respective patch series:
- https://lore.kernel.org/all/20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com/
- https://lore.kernel.org/all/20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com/
