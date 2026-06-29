Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32F1ACEDE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739939; cv=none; b=PjJ2ioSafKW/XZ3qscV9GIqiNWGmaibCAIUk1uLRuExoOfNdd0K2aY2Bw0+lcrVV7lzgmhrvSbNRM9nSxz6jhKchec1wGdu3F54sm0fR89fyqGMhvG9BfzlcCjVNJ69lbu0xmXkjhdNIXTwv9B5gK/WAP71KW79Fau/zZhVXdTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739939; c=relaxed/simple;
	bh=b74JLjLDWqk4nSsYRgZYJTbHpFo81IIWs/OAbVQDBIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Csg9PetWDchGNSGI2cAbmtgwFGiid4cCEkyLX3hWw7aPRC3kRd9g6g9uKk/muF7AtHz5NI+1qZeeotbXXgaUjTG1OPXn3Atn55joCzo4UaB5+PEQqUHokOkKf8raFcCjjOZK1sKT9GzUcbWgJbQgyqZ8CLibqPUkYoMxusDRqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4a2HQrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFK+gKF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4a2HQrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFK+gKF3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATR2b2592803
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=; b=n4a2HQrNBuc61hNa
	AW87dSWHcEbWWQsMytCixz3TLI4CBPM9sdXPcoIYpjwXUsiPwhpLhg6fMfGieGJD
	x/0vmEMSeO25SC85frhhE41QNmIo4jVzFgOx0gmjl1K6R112DAMU4nhkdVDJMnxj
	X6oti9mhuMZCo7QgKytjtc1skWIpSrr44/DODPX4ucPxqL9orhvjYoRHmP+uITQo
	00J/nk6LyL+KvFUmpB1PePufkMi4KKNBg53C9TrnikIWzIlRVOqLZ74WDDXrnVes
	+cTW4OoEaLOy5OJfPnEhnLfYUPpNRvr6Fi/tTHOBuWOLINGqfo4Nj9mSdzC879iq
	+TLy1g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhv47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:32:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso3289853eec.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739936; x=1783344736; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=;
        b=IFK+gKF3FASW3jLDx7DIjcDlNAu2jFXen2huERbhkfizppQ9X2fK8ITE1og7QsKaYp
         lV0vH+CSo21nw1QOMHhcfXfwK7SOSmWQjHgIPqNU8cmSx1MySBIP6BgD+nQ+FYt0qz/B
         McnGilel9wKdJBsmUR7ZZqFhC80uelp9mEfftKOCzt+qkCwNGhX62xQP9KkrIkuE47Mc
         DEdyDI3rssr4tF4e/dftUzHQndeDuanSv3ySx/Mxj/YIVSvdp3YN0fxM7725o9PRw5b/
         ktiMKjlbNOc1vEAIjQBpTK7p3yJdjjfVYfqUEay4YzBOcQo8w3ixVuSL0fInA9HyX8mw
         8qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739936; x=1783344736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=;
        b=aRtCMVLFN8+7Qf4L9jQofz7E7EMkTSmLT1pBTw77ndR2aLQZoKhw4JbTtrH7lcZkss
         j5N2/KpkrbQvqF/hX2dBllSwH8b6p7V6lwU5oIbjTYlyQHMKlj30mP5Y6KHNBGPofnZ9
         jDjwg5/o38OWuJGeIcBewdG/LsVe83ZN9x4A7PcrOt+1mmUqDexmBcULK5UqFMizQeA5
         PJYWrHVlEHMv+jf2MH7ucXhrsSHL4BdhxTWieZvqobOLhOFt1O3NmbpSO0sScdokaebE
         Vv6Y7VXMgQPPzx3vBnXMvlXLAgBW8y4gfglyOimxPwSVTGS7fi2DnmEkr9wf5DtkVXSV
         oRdw==
X-Forwarded-Encrypted: i=1; AHgh+RqBp3TWSu0BQl/iFdDOkTpOA2W6TAFUpt5etuoA/Pe0BwS3gZcStXJo+ub0nQLybV8Dwv9Pr1VWAX0H@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44eDcU6xGtD/j3Xim8xcjNWfUwGGrKSWCl/VxyccggyqXCGKY
	i4fY8afX9VKsG6IEO5yZQQXW1T4t2fxGr2qsqnnYY1Y2sZNDas4m4FtnSABpVgbkiF0R+kFQhQF
	3nbsUW83IlpPtlQyEyiChbMAoF6liIiCjF/Wwkv7dUrm/TX03D1uAQuL3EjAWKfTy
X-Gm-Gg: AfdE7cmjMT3JAz0Xw7BK8TZe/UbnVGQl+FyVICW2YFsFOR4hYJpGlByWc2u6GnbxamR
	KtRRVhgYAUVa5Dm02k2jFt1cU5h4oUeLR7TFZwCnEmN+i86OP2k2DJ5Xu040r+ubhFX/uyg+S/d
	EdlT4zYw9Bt4evchjOGfz/IsXyT+hnHO8rdCuSLaKi3k9oScGP20c2TspCHv3fAVVWvQpr5ovXs
	KpSHAEHMg2tsENVpy3U49Tvh3sEAxLwvXI4lbFQsYmUqsDpZ5yZP6y5geGbRtWguRxwfrZz6N5P
	8t2HA2PzR5FYgGGNWm0Pc4XhCbCT8VsT6Up6gghllMROSNTy2zoeO2Xlhq1Npa8t7VQDj2wh2Eh
	bgPA3n8FAf3LAuimc/U68anpveUc61rAwda9qjzVxctlwza469JakVOhlxw==
X-Received: by 2002:a05:693c:880b:10b0:30c:b0a8:c9b7 with SMTP id 5a478bee46e88-30cb0a8cb0bmr5980139eec.41.1782739935523;
        Mon, 29 Jun 2026 06:32:15 -0700 (PDT)
X-Received: by 2002:a05:693c:880b:10b0:30c:b0a8:c9b7 with SMTP id 5a478bee46e88-30cb0a8cb0bmr5980101eec.41.1782739934422;
        Mon, 29 Jun 2026 06:32:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm60819417eec.7.2026.06.29.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:32:13 -0700 (PDT)
Date: Mon, 29 Jun 2026 06:32:11 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
 <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
X-Proofpoint-GUID: uPrTlivxkxbWbDsHAnk-qSh36EfCtm3H
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a4273e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Qo-gMjb1dFaPh1ck9-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMiBTYWx0ZWRfX4BxahyT9LD9l
 CjxNhKa4T7uaQDkudp9AuMkmlRUWvFJ06xoJQyLpsKupbwYorrW4AT09fRyu4PNan7jmbnpWQhf
 JYBS82nq8eKQmCFhJg/mVIHFPLPfNdU=
X-Proofpoint-ORIG-GUID: uPrTlivxkxbWbDsHAnk-qSh36EfCtm3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMiBTYWx0ZWRfX/Q88/ghjZI5T
 czTRXPY3NA3yjHtuOOg3e8yDndFhdypdXGLvGetJP7YK3caM1zeXj6H35RlJ5cVXekb7k3AZcya
 iBNqKCRxKZwGRQl/F5BCiIIpYqeY1+soz70XkH1QKjEjyC1bYnAofivPLzOlU/dLGx+z313vcDu
 FSZpezmoQSH0Ab5mQNkpZfmtjqjTNyEG260dL2C32nn72hpx1lUYp4fmetBmKx/y15jovdukhj7
 xYRyyqtwGSV98skDy89Ye+QMiGlcEfLHHJHx0SkWOK/ce1iQCoikE3i3vSBMYrjiha/YhtYAnXi
 UvpDwD0L9YpwIclD4EjNlEL9VVj0EM2pynAD0TZkiDSyP2hMgKvhhXDdetnYtRIbQbXRVEZ+LAF
 MJ6+gaYuDektYFLwcDDaBbQngoSw+oSg0F9gyufxzoB++xe4wR33+nusTBmlQaPodkir28sQaBL
 PMSJlk8/VNRNRGNeDdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290112

On Mon, Jun 29, 2026 at 12:30:37PM +0200, Konrad Dybcio wrote:
> On 6/26/26 5:53 AM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 2:49 PM, Qiang Yu wrote:
> >>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> >>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
> >>>>> distinct regulator lists and clock descriptors for its PCIe clock
> >>>>> references.
> >>>>>
> >>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
> >>>>> match_data to select the correct descriptor table per compatible string at
> >>>>> probe time.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>
> >> [...]
> >>
> >>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> >>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> >>>
> >>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> >>> require QREF. So I didn't provide its structure here.
> >>
> >> I don't quite get what you mean. I see that it is there in the graph
> > 
> > I double-checked with the HW team — QREF is not required for CXO0. In TCSR
> > HPG, I think the QREF components you are seeing are in an old version
> > diagram, but it says the QREF for CXO0 will be removed. In the updated
> > diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
> > from CXO0.
> > 
> > In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
> > instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
> > 
> > I also compared the description of the TCSR_CLKREF_EN register between
> > glymur and mahua on ipcatlog. Unfortunately, only
> > TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
> > this is because these registers are not documented well in ipcatlog.
> > 
> > So I think part of the regulator lists you commented for USB instances is
> > not required, and their dts node also can to be changed to use CXO as
> > refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
> > names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
> > I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
> > in the diagram. Can we leave the USB regulator list as NULL or we just
> > add them as it is harmless?
> 
> I believe the internal discussions we had indeed point to the TX/RPT
> elements having been removed somewhere in the chip dev process, so
> the regulators can go, in my understanding.
> 
> As for the refclk toggles themselves, my understanding is that they are
> still meaningful. Although, we should be able to just smoketest that - set
> all of these registers to 0 and see if the related IPs still work normally
>

As internal discussion, the TCSR_USBn_CLKREF_EN to digram instance mapping
is:

TCSR_USB2_1_CLKREF_EN -> usb2_hs
TCSR_USB2_2_CLKREF_EN -> usb2_hs3
TCSR_USB2_3_CLKREF_EN -> usb2_hs6
TCSR_USB2_4_CLKREF_EN -> usb2_2
TCSR_USB3_0_CLKREF_EN -> usb3_ss3
TCSR_USB3_1_CLKREF_EN -> usb3_ss4
TCSR_USB4_1_CLKREF_EN -> usb4_1
TCSR_USB4_2_CLKREF_EN -> usb4_2

I will remove regulator list for TCSR_USB2_1_CLKREF_EN and
TCSR_USB4_1_CLKREF_EN. For the registers, we can leave them in the clk
array, the driver can still vote CXO as parent of tcsr_clkref_en and the
register setting in enable/disable is just a no-op if they are really not
required.

- Qiang Yu
