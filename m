Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73D2E1EE7
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778996384; cv=none; b=k4+7Ooaz/6iPSpeKkcZSHzKwkQhVNzaB+nWqA5rMiCiYfqsLXW/cAw9WrlBF8Gs4oWnVoe477TtEGb0IcLWQ78ivq55isitf4cGIzZ5qFUxvZ4CwkJgYlKuW8de1OK30QClYbJ4XAgCJCff63mtSHHxwT7mi729x07GpbNyLzFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778996384; c=relaxed/simple;
	bh=OyrYy3CxVCqxEwCBM/K4PBbKBewf9EfR5aSv4aTPx+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4D5zoFvBPAYbaXQ8Wxr0MzNQWS5EygJp2q1rjB9lKXSny66jEUvbDwTqzk+hHWlnS50hBIoqS3HgSs5/+n9g5910D9DHV0UwZ6zoSkYCZaqgxoLSc7YR10mNygUb0Lls121X3ejN0nmg8SKqnqvyocFSvSWdnnrhbjU6SiYcbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUcZp13Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4kYQrKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUcZp13Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4kYQrKC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNUSaS919547
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92C73o0HZQMw9i0zPsZfTXUY
	8FwNUtkb+k0e+b9dS80=; b=aUcZp13Y1ffz4lYft8fvI24IcyGsCiQufoVyQxuM
	UZfrNAp49+hAinRO8QaWMKcn06EO3+hhth81njFIBZy+2ECKKOf9PNJIn1dsUz6A
	RWPcztlbI2pRIvWpm5jANVy6PaCscxXnPLKvzGvtsnIVZl1+9ilVGkAOjeem6eFb
	8UTXusIOeKEtxAexh0fgKupVeB9FV/a+ZbuRi6mnkT1Ml8GE1sSOUNgAKFrwL8xU
	94b406Yo9gLERVyCdym7fk8d2bkE9XDC9qw0ZEGB6JomAtrCbE6wbk6XuyK9g5gu
	HLaESroJGR+alhFscRaWJJimpJUQXGR5G74LraEBXMrrtw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7t639-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:39:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so1654505eec.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778996382; x=1779601182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92C73o0HZQMw9i0zPsZfTXUY8FwNUtkb+k0e+b9dS80=;
        b=H4kYQrKCblIhRVLitklWjK1tWRvUE6QFgfaTWKG2XOM8ILzuqLc1mvOWC+Qzd3mgBs
         K5Ct6iMNkcYuPHg+BUBC/7W5mogGwk47PvoRxO12KxsbA6k9wkUwwnUlbxomCvM0LKJ5
         gnytucMeRP5/kG3hZPkM1pPlqE5LxgzthF/Y7l7LEF4S1mva+yrprLQlhIME3Kvot2/u
         CXViDHd9j5460SHgKsI3sTxnJ+EdNzYg3DC9H1sQCEndSYGSrLYvNrrVJzKCyQIvyYa2
         Ca0U8Lrk9MxvAkYSPFG74KgVEIVsABeBG7zNQN1NiS4go+jc2NntNoE8fOR5OnwPQXdO
         ogqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778996382; x=1779601182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92C73o0HZQMw9i0zPsZfTXUY8FwNUtkb+k0e+b9dS80=;
        b=dKeZuxgAB9stVZ2n/J+mm1g+8NnGNHO9tKJxET43XHsLYM7MKQqP9EkoEL5bxodQFF
         NyuQ6dnb2qDgwdvKTCo/wMZP6DE3C0wVHEt0LPdAtt1SLnguVvS9erZ5IqdIf09uAhpv
         JSO7NuEr1jozYUtqczxU4QX5BqEGmAw8ZfIGbUYau5PdnErQlDrbCVcfpsFtJ9Y5fMDo
         NQ+6b7lpZdodByqWbPCILcnP/tggZjcB2YhPX83TR1Keg2G47CkXcVNsfzqJV7aux+y3
         8VKExDqAnjptzqjUjb+tr1KhfcSQRZXRQ5bWyBwcJel8OVecx44TnAALZmhX18THkV3N
         ge1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Y0tpIUIuBEGLATsxYjn9/Y33FEch8KsOLKr50lWnw4B/SnKhgOGNR3/H0CR6bd0/NWLl6ISHTS+2T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj91wKCOSbLOiFFMqDbc9zr+Yd/+tL1PNCxa8OpwhKc94wuoP6
	sKWZ05BwXFoVXl8QY3rp0zWb6Xeebiyl6G7s3fYUayxNYQyM9fpp/x7oHjUCUXFQLE/Ta7gI6rS
	3rRR/TuxawYo2iUMkXHA0fcfxu+oB4QxZmSI1jwmL3/oQp447pNfyCzRdHFwqvzyL
X-Gm-Gg: Acq92OEm8F3eNH1oqs3PyVl+Rjfrff57ci1p6gJZEAPgtH0yiFoMRUzN0PwcUrfvrpD
	xfn7LZNnh9VwzCvwHCh2xSpSNsgsrHR/aOrx1vqg6vkl0vJbJ+K3jHiSQnGq5Eep2oxkG9s7kHI
	9igntHZNh9lGzw/gG4IHJyDoAcSHzQAWYdsYWUDTPwiEqNCkjmbf0o0DLAp9qyUPnDuPHEwkA6t
	mJvIDpvbt9zZJhfYPpmgbj3D0tCVrIwdsADWS1MmekSIz0+tTupMgZdj2zwJmXafm0AEwRri2SR
	4NxhbUzJmlehyeHgtUwI4xqmpHdPz3Vv9qgFo7HUd0mXmfx9NMvooGXNUdLsFnXDX4adVO5RP19
	O+ZUvuBcH6O07tqH9+iD6+blxsnVfLEJ7RJEdTWhe6T8vQcUhy5gteI74Ixre1sCNGL8a
X-Received: by 2002:a05:7022:6b9a:b0:134:fea9:f107 with SMTP id a92af1059eb24-1350573a436mr3748701c88.33.1778996381455;
        Sat, 16 May 2026 22:39:41 -0700 (PDT)
X-Received: by 2002:a05:7022:6b9a:b0:134:fea9:f107 with SMTP id a92af1059eb24-1350573a436mr3748697c88.33.1778996380885;
        Sat, 16 May 2026 22:39:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm15485227c88.13.2026.05.16.22.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 22:39:40 -0700 (PDT)
Date: Sat, 16 May 2026 22:39:38 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-outgoing-literate-dove-2e2a73@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA1NyBTYWx0ZWRfX+Q1+pQ29onLF
 UieejvrY6nRV50grzuZD23SZQT4YJgSZ1agoZk2PyqmmNWm4rv9ttW8YXBCLjhhpU5BkqkBX+td
 6o8Tk52gJGlMUw2MWqZkhpBdYlRm77UNOB6tl5FdHzDSHk9AiRB/ZM+uXyXMOrMmpOpIDp8brB1
 Bo+Pfwp2zKMOktryR8JitkkhRhcxN5DVVTnhoHvcpYtc0ODIBGJtW4TCV7ZA21Ca3ZgYqA0lgC7
 OkMzkgTHMEsy7Lob5eNOrCd61QAPvHZrijxmB4/WDlEZ46Ak1ZSJKXwr5mC/m+kMJDx2pJlODQU
 zjpe0pE4+90uI9qSqluAuIGKa7oTn3RAz7XJBVe6ZGYhdZkj9CIAGmLZBs8qvZDchYOF0/OG7Um
 E0IFXZ6IwFZt9aB8X3k99Sj9xHZ59sQ22Z2CtEUeMcJik00clKuV4Dv8n7Lp/C7SUxE5h0XrreE
 MdwE5vSQrTy1OMcZPUg==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a09549e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Uzsr7iAuEFisXTRfTTMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: -9_I3kEqsdX_rzXMoala4PLfanLPPNVi
X-Proofpoint-GUID: -9_I3kEqsdX_rzXMoala4PLfanLPPNVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170057

On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> > Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> > required by clkref clocks.
> > 
> > The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> > QREF TX/RPT/RX components, while SoC-specific topology and instance count
> > differ. Document them here for qcom,glymur-tcsr.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > index 1ccdf4b0f5dd..57921cb63230 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > @@ -51,6 +51,63 @@ properties:
> >    '#reset-cells':
> >      const: 1
> >  
> > +  vdda-refgen-0p9-supply: true
> > +  vdda-refgen-1p2-supply: true
> > +  vdda-qrefrx0-0p9-supply: true
> > +  vdda-qrefrx1-0p9-supply: true
> > +  vdda-qrefrx2-0p9-supply: true
> > +  vdda-qrefrx4-0p9-supply: true
> > +  vdda-qrefrx5-0p9-supply: true
> > +  vdda-qreftx0-0p9-supply: true
> > +  vdda-qreftx0-1p2-supply: true
> > +  vdda-qreftx1-0p9-supply: true
> > +  vdda-qrefrpt0-0p9-supply: true
> > +  vdda-qrefrpt1-0p9-supply: true
> > +  vdda-qrefrpt2-0p9-supply: true
> > +  vdda-qrefrpt3-0p9-supply: true
> > +  vdda-qrefrpt4-0p9-supply: true
> 
> Either I do not understand your previous explanation:
> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
>
> or this is still wrong. There is no TCSR here, so this proves nothing.
> If TCSR is TX0, then you do not have five of them...
> 
> My previous comment stay - you are not describing the actual hardware
> here.
> 
The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
as the QREF block, and each component is controlled by the tcsr_clkref_en
registers.

If a PHY receives its reference clock from QREF, it will have a clkref_en
register. However, this register may be located in different regions
depending on the target. On glymur it resides in TCSR, so I added these
LDOs QREF required in tcsr yaml.

- Qiang Yu

> Best regards,
> Krzysztof
> 
