Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8AC2D2495
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784499440; cv=none; b=m+/MEc2W7YzkeQVrRbFBXnqKDVaXEpCNkiff6bG9ToCAGxtFfpqNiCLdthdjNwzCHVCbAhP8UXo7NveW7szs92MlnMAxL51kB7JXomdntPJXOot3SAtcO2PbZFC6Skeiw8RWftS+TosorkL2/Ef3+7c+JvhOtvORtew2EDOxY8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784499440; c=relaxed/simple;
	bh=WWKK2Y6/JJVXdjmuDmCoTcUjwUOPvrqBtb0/JcU1OPc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fc/ODTTfsnRCQ5YrN+KNaP8DAvgxIAj5oQrVMXjiyYnuqtgrojUBfI2lirGpfRLoaO3rMpBX+D4llfrUuRhb8TOvJkVqQYTfFnn+6LkbtM+DGsDND9XXNB7RBWNzlOyL4h0CHXb2/+pskaO44JU1a4TGAHV0FwR03VI0wS51bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MH1KFPMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr0oxc16; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MH1KFPMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr0oxc16"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JLeEfx137833
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYxQso/u0z9R8HjD1SW36yatESiP4fHZO8aWX+nFPXw=; b=MH1KFPMyjqLBWVNw
	v4ZfEetkG/NMq6eREP3DreSr0zhYrrTgud/Q4TxFnY/KGHISZJG54hTf3o1Ah00l
	Ggn4OCbkOfmGa4/+uSuyq6peB8AXQYlcgNli/Q+tbOqJio8jC+PmqXW5sWH6/zKN
	WdA2tze6dlRWvI4EFskBcE6WxH1o0Kqg2zLJohqFFHhu1bwUJaFQpi+NOEXoN0Co
	8W7o6+Tdhs85VCVkVurO/sm6gHvgnh4CjpaHCga2XCaI3k2pd7l51sJ7i1ptCilO
	qFDerXDC7f+sewBbcDn1EQXB7bQGIkhMf/Erb5H54Ogjp/Lnw/wGfadeclL5JrL5
	tg19Ew==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhkj4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:17:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb74d5db525so728279a12.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784499437; x=1785104237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYxQso/u0z9R8HjD1SW36yatESiP4fHZO8aWX+nFPXw=;
        b=fr0oxc16niLoyrCzpCqD5dCOKyzO/Bt1McxEAPGRb+G+mXQlnXVEjEdmxjlY30KS+0
         BH9YV/zS0W2DoENsytupTaEbdXiInBh+Q0AVV2/1zFIa6WzK6+dbSUOe31hPS+WRQZp7
         4zm+1b9KAVvhX7ti30/hPQkILb1P4wu2mzcLwoUz4THVfoNrC4GZKjKOYjmoINrOq16L
         shJ8XRDceCV0SpVdVKL/vL6A2GOlKMyfTllpkK5xhyCbj2RN9Yq/1uDObbqLvL7jbX8B
         qdlRzu4AB+ECcXvVKFE0drsquJiSKVaKCad8dNyKOQxT5pkxd9ulzCRVf0S4EokTrMzt
         taIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499437; x=1785104237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYxQso/u0z9R8HjD1SW36yatESiP4fHZO8aWX+nFPXw=;
        b=fLYyYTF63FmjCd0l7vLodEk8NgIeMXpHOhhHcQQsmUMSo+rVPRn53pwM3s2S65wmUY
         Jdy/+pMR8nDeM3n71AZNXhRY9YmKA6k+WY8e4wRwBArdOtCwMg7r43LIoJBOXzZ97WhQ
         fKJaGNcPVznCcvZzzryxh5LDDHpBxs+T75gys5G9l0lxYE6AqhsdotNK504NTKTi9zzH
         mlS9wcNnanbspq+reurBtR8cPPVYCl17ggcS2pDcafXtln66z5xciXRiJUXF9/n6CLRv
         CDFv++xAe4KubPMs7XJir01d4fZZBKSz+/ergUALnVtDGuEtCJ3sC1GbUYARSMLJL0Er
         ZpBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8C1X3ClUFg1W52kimICUw7Qsws/N6HRr7fjTcabgRM/4rVyE0gcp3jTdNvhQf1QdhDKuoAOIPFrgT@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQT+i/wVnei8iLYeIFEXe/hT5CGRR+Ek12csOvh/GM7IxnK07
	/WCAySsTXbWCog6rw9Edprg6531O+P5+Z5Stp3biPUoqLKfr4TdD4PbuK68GpiyWOPzek/XWtQ9
	eM/caCMp4en6uesdw8uN7JB/6GFiC796EuV5D6biCPC7QHDCG5jLlGf6hg7WMIjVL
X-Gm-Gg: AfdE7cnNA9Tui6NAd7B1VPyB+xwNaeBhpGMK0YkLHXj5SZTKaSvnOMV/WDUCXjKFQBt
	TrCPvIwxnqqmw2AO9V5E+jCsrnxPYz9/xLSDwZNrxE3PmGFiI/ZzLqa1WwuB+TqK4af9NXANTIW
	rsvpmnegFinJ22nSEb3cE0FUGr9taWMJSXOdPxraXTfDwcO7fMHl87bfNyHPhCNRf4+gMxoXAsF
	kEaSeOPUyS6UqhtgT8rhWfp+HxWzOVIptsg3TkpByocFBL6/ji1r8V1EecJ/L93HibQrvqjS2ei
	D5k2tJk9+KQYKC+Zue1Wwuk+1TMgahbTjhfj2dcH//u9UZhneNaLg/8lZ28UdKRxqCgPD/p1RAU
	YN/o/mB8xQP2UFBZX
X-Received: by 2002:a05:6a21:4591:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3c3ad62ac62mr12187776637.19.1784499437220;
        Sun, 19 Jul 2026 15:17:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:4591:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3c3ad62ac62mr12187755637.19.1784499436736;
        Sun, 19 Jul 2026 15:17:16 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb676sm3625211a12.19.2026.07.19.15.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:17:15 -0700 (PDT)
Date: Sun, 19 Jul 2026 23:17:10 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
        Michael Auchter
 <michael.auchter@ni.com>, linux@analog.com,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        David Lechner <dlechner@baylibre.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match
 data
Message-ID: <20260719231710.14a669ad@jic23-huawei>
In-Reply-To: <alyP8NlQzRpXnSq9@ashevche-desk.local>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
	<20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
	<alkmAcDvSXr_COc_@ashevche-desk.local>
	<ondynh4kmchzugk2l24klamrcaje3qxnhgiks7gnc46wwwvo35@hysk2zaimb2e>
	<alnknz55FbyyqqlL@ashevche-desk.local>
	<gy2dn5emz7sreavy6kioz27f3sx2ip6zhkgzs2uz4qzecpkrbe@zgsortof6aqn>
	<aloD5HdbntKu--xC@ashevche-desk.local>
	<20260719005533.41520a27@jic23-huawei>
	<alyP8NlQzRpXnSq9@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5d4ced cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QyXUC8HyAAAA:8 a=MxYe75D9c33W5Oe7pOYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: NI4BSJri8j9y3-vkH2V85oTq-fRhcDtp
X-Proofpoint-ORIG-GUID: NI4BSJri8j9y3-vkH2V85oTq-fRhcDtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI1MCBTYWx0ZWRfX4Crh0EKB6Ep6
 oPjGkK6Cnm6c4Ub69qiZIa1yBt2QSOwbbAzMg+UuT6VTX12FqeXPYSP63fiJa8FJwGQ4L16zR7O
 O+TTJB4XXSfVyN5jl5e/jML+LNMj8yTeIU3miG97mqlr/J6pCxDupFN3tCi39juG2GFPjufrXZu
 IiLowmJAZUoPAkNJsL9vgOIcu+QD8G1FYNsZE59z4f06ZCCmj9+U6gOEUPWgjY6sdPEd0QcUwzk
 51I5skVUrgHTOjxfGCp5SfE8mLWmrNjDgB+2vNHyistj4Vg4m7XTFx9PIUttsGotMPBjJCHSXtN
 C7i7z+Y4HlnFCe/bb9GknT3f+LqdZjWJOGxiZKeeKnUJCm9GWKtNKQqmt7G8vamGQTpY611UPO9
 Jd9CDHcSwPEswN2ckQU7Nu2SOGJWyNFcdgI5shE5hMFc1J80weUgHBVg00S7UMUFCGh5rHdy1V/
 1x78b8U0QozQMV2fZHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI1MCBTYWx0ZWRfXx0vuC8Bj36WY
 u4ibZIu6HcKoPBgwYIugHZPy21N3JyAOmpMGMlAW+UFHcaZTPqfsVcssY4Au+AEuSxFHD2qMXox
 qX/NWVT5Lzvt1bKwa/jVHgoeiD40A8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190250

On Sun, 19 Jul 2026 11:50:56 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sun, Jul 19, 2026 at 12:55:44AM +0100, Jonathan Cameron wrote:
> > On Fri, 17 Jul 2026 13:28:52 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> 
> ...
> 
> > I applied the following rather than going for a v9 for just this:  
> 
> Thanks!
> 
> > Shout if I messed it up.  
> 
> ...
> 
> > +       if (!chip_info)
> > +               return -ENODEV;  
> 
> Perhaps stick with -ENODATA? (Maybe in a separate change, dunno...)
> 
oops. I lost track on where we were with that. Updated.


