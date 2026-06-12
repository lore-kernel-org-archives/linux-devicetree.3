Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB1335B63D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251216; cv=none; b=RJ+eieoqOa/r81/wCDEESmUZpolnmmaBgRNVOgpYxVo7RBfhmCoeQ9hkRhOkCxhB0m1CkNyoOp0PuFo1m+oc+3UnwJiYQnKJMYBez92tKu29lh6edQq1z8LgfY7Zql/8xq5wZafh8GOSFSASUhMaAFmwLuXbSOy/Lp1KBFtSAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251216; c=relaxed/simple;
	bh=tuAIt/R7Yp0sjjeF+vLC886o/XFYgD5cKQeAyjph9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUdR1e+60bMtuAsPPlpLzH7Y0IdHrCRH10/LnJN/rGROGEc7ynAAxuElJC6Etg501/TzMg8i2h03tyS8ZNmvcln8UNvHlt4FymN/JbzWcLvsGk6oNxUSPI0IqP56LbjN8seIPYaSRv89df6O5RITuj1aTbKUF8uGq/ErVNCFn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiggQPRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzCJL1rp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiggQPRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzCJL1rp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39mQn2497232
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pCUAy39XvVhYmfJPAmpzk/43
	pUuK99XaLb2hRC0DYLE=; b=kiggQPRoV026e/wndGa3YFp8JUh7kmWlKww9c5oZ
	M14BlwLPrIAelHYIxtc2OAK+CAp/kml35xbmqqxp77PxXiIm8LSPXmw24bwCgc7D
	Ei+D5FbV7zj7aQyUGTwDcnsBLdPkvTBQTTF5wJpADwWSGEPCRu5iyeKkfcaX790M
	hAkZPPYzqMlnOT7eRZzWdMftjYXfCK2cd8m0+bBMsvNawk1ipWARkFegpKm/lWgS
	hlkHCwA1uxahXcNr0IkFaCf6Tll1Hd5EgqYGdCRXBmHt4OUAuZXvgeULZvas7ceF
	kyupmAy/aFuk5wxXsz3j7Ry/28/vQj+a+DCbMlCcyh+oug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7jqg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:00:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517787172b0so11198031cf.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251212; x=1781856012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCUAy39XvVhYmfJPAmpzk/43pUuK99XaLb2hRC0DYLE=;
        b=RzCJL1rpryY06MXdVSdxKrxfH2E6+d8uTQ6Ku9gM+c4ExhKsWrD7NSHtARadQYnjIv
         A3/ZnJLv/f9RehWWwRoeDIhq+OvI6V8yek7NWWnSJMFYowyDvoiow1XsqMypBM8+21xV
         EHnbI9JUdm2lwFVsq0PUgJR8E79iUwjFxD3SApyLk2HzVWW4oqKXZZJgWaFo8NwFHZ3I
         YC/lqDc3RDwsxU9bSozUQXwjxWMUvRsKHv5M9R+pD3XC0BJDU6GHvwfn77ruoJ5aPnak
         y5+dcp2TJQjfuihmjaaK09gMc+CoZby11f+wEdGii9FS+tuwS1GFK5xNalY2+UychDiQ
         wR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251212; x=1781856012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCUAy39XvVhYmfJPAmpzk/43pUuK99XaLb2hRC0DYLE=;
        b=IX9sX6I5Qywa1dAS+mQZ7NSZKqu0tcLJQn6Rmz+WRwH6NCTs1fCAaULx5nRZztbP8w
         CIF/5UOya4umN3/EmyNbxJtGXOX7O1Ge1RJ2a/eHttoQxx2WDItRgO9OqxebpEhrz300
         OibpvZukoOqgTzSOhEBAC5bWknT+lsvzwLqZyds7DRJq24J1NX2Rt6cKVA8gL8pj1wLA
         R9q018NDexyj8+XDtZK9K8DGYrzKOeFOaj1jKfzKu+jZmtqN7z4KTnIHTA2BSiO7fFML
         +0Owu5/GrbDpynYTPofujGJbXL34/LiRZCWZHwomMGOMeVIIC5p5LLUURqMXJdQjNR0S
         0p6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LvrruDQuGtIdyXSuJeFyEpzPCAmE7POsAiWmnTM06T3T1T8wTVYI7JNqKYOD5GNpNB6NSIG6KoccZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwiMixXUhFXQAEA5Sh3mAa0am1JjUIwjOi1sZfZ9/4e+rUuHCPZ
	5grDTa+z30NTZ4la/bcsdmGJq/0ULutsDxaI107MXWHYIKFw9irhr+qYMn3A1Ei5EJ7HY1nOmfd
	VR9/N+OR//3ittWc/m/Lgu1zY+6CLpWABeHNN8dYYERXFDxazkkLr6ppQ93DIZFOr
X-Gm-Gg: Acq92OF9vnjtJqFlhSjcjpcdlG7DUx1TNW/bMPEgZ9v559DaaNrZwLtLSj8YZVDyvoq
	CICXN+Ut44lNeUi55ks+Krhx3d9oUj+CfgCSKbDbtQ5W5pzwP5waEWPaEQmg0CGDvaqKm7dQhT8
	0Hd8VNtp5X1n29SMj6TFVqpuAE52bJhtDjZ/tBx2AuL2FWKWHz/f4BmSeeHJfQJaAbtHzFlycgF
	5vyH66HUyvD3fg7q8lViO1mgoKL8N4jvL88v7UaxcRI5onHYu12a6rzXKS3f7sEfzv8Vc5z3TlJ
	WppEQK01RpRo1uPcr7hufLKTrKCN3htm4kbpeH1O3BrAtNMy3/mcW37wiO12rMiwvL8LboTbf1K
	e0zr1fINcZXOV7ZXjMwzXsoDhNDc6SIlzTBpEJIAs7Zop5cd9bmPnre+UNNiwRKH6ItcK8PYK7B
	kkRjfG7fuYldoD0PATzCDNH9RP5aFZtktoZXs=
X-Received: by 2002:a05:622a:488d:b0:517:8711:d466 with SMTP id d75a77b69052e-517fe59b87cmr21873751cf.56.1781251212120;
        Fri, 12 Jun 2026 01:00:12 -0700 (PDT)
X-Received: by 2002:a05:622a:488d:b0:517:8711:d466 with SMTP id d75a77b69052e-517fe59b87cmr21872951cf.56.1781251211630;
        Fri, 12 Jun 2026 01:00:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3d0bsm322680e87.71.2026.06.12.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:00:10 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:00:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Message-ID: <5vfu3h66pelbhzyfqnagxg2j6r5mn7jupx3nmewt2zsggfa6sj@ttqr775cybxa>
References: <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
 <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
 <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
X-Proofpoint-GUID: u0JfmceJe_1h0Cd5y_XUydE72aGLFxn5
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2bbc8d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nvlhaSRbYAXosuLdH6gA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MSBTYWx0ZWRfXzJyyGMHsWX6T
 N1suyQizdb/kVGiLFAgEnbcTUfhoQcxLHttpbXRhWAKUuAUzgAgjjrKGieYaeOFNNMvbvSH/Fml
 rmGdctJ9M5d9OGB+foprowwyrBoQgMRQ3Z3GxGQ34VGYIHH+/PO207w/8umkPT2qPw8NFA7q4V+
 c4PhsEHgbsy3rKbvbUSCrBZZEdjX69OJc2f7Cczoy3qocByt49BLOjlzyBiDGuLWuPka50shZrc
 mNaIA2MP+2sWxPK4aBOJeAnAgk+y4Qt5yHuwDHORfBHCYe5K8A8H0tQ/c5jELtzo7rytP/WdDVz
 uDW49Al9K7uROq+LS0TyImesuXycYYMuT5hxk5SZuy+U19LN/ZlrgTzSVqKYbEXhL2Hu2wQloN+
 EBy+oc9SzziF2zL/s2rsrZSf0POm24lofVz6AWBUh8PwOBr5uHA/vr/2UXEb2w5TlSM9Fbxn3DB
 g7hBEP88NtI7T8c+RDA==
X-Proofpoint-ORIG-GUID: u0JfmceJe_1h0Cd5y_XUydE72aGLFxn5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MSBTYWx0ZWRfX4hY+IcTPSUmb
 f0rAkvWzGgnH6hTB3fW3vVnWFemf6AOmN6aAPVUY9okfda+hDN1EiEwgEDYXfIf8KrEevC1dZ+Z
 nJl0+6zbFQEbpZsPg/2gGpCPlfLMJ4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120071

On Wed, Jun 10, 2026 at 03:36:20PM +0200, Konrad Dybcio wrote:
> On 5/17/26 9:16 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
> >>
> >>
> >> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
> >>> On 14/05/2026 08:22, Krishna Kurapati wrote:
> >>>>
> >>>>
> >>>> On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
> >>>>> On 07/05/2026 13:37, Krishna Kurapati wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
> >>>>>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
> >>>>>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
> >>>>>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
> >>>>>>>>>>>>>       1 file changed, 2 insertions(+)
> >>>>>>>>>>>>
> >>>>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>>>>>>>>>
> >>>>>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
> >>>>>>>>>>> compatible. If not, explain what is not compatible.
> >>>>>>>>>>>
> >>>>>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
> >>>>>>>>>>
> >>>>>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
> >>>>>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
> >>>>>>>>>>
> >>>>>>>>>> Hence, I didn't use a fallback compatible.
> >>>>>>>>>
> >>>>>>>>> This still explains nothing. How different clock makes interface for SW
> >>>>>>>>> incompatible exactly?
> >>>>>>>>>
> >>>>>>>> So I went by the naming. AUX vs COM_AUX.
> >>>>>>>
> >>>>>>> The naming does not matter. If the clock is called
> >>>>>>> "no_one_expects_spanish_inquisition", does that make software
> >>>>>>> incompatible? Why would the name itself matter?
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
> >>>>>>>> clock-names mentioning "aux" ?
> >>>>>>>
> >>>>>>> I don't know, I asked what is different in software interface.
> >>>>>>>
> >>>>>>
> >>>>>> Hi Krzysztof,
> >>>>>>
> >>>>>>     I checked with the hw team here and found out two things.
> >>>>>>
> >>>>>>     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
> >>>>>> regulators used) is the same as agatti.
> >>>>>>
> >>>>>>     2. I thought we could use qcm2290 as a fallback since the phy register
> >>>>>> init sequence is the same for Talos/Shikra/Agatti. The difference
> >>>>>> between Talos and agatti when checked in the driver was the init load
> >>>>>> settings. I checked with the hw team and they suggested using the init
> >>>>>> load settings which talos was using.
> >>>>>>
> >>>>>>     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
> >>>>>> fallback for Shikra.
> >>>>>
> >>>>> Then I do not understand why you are using qcs615_usb3phy_cfg for
> >>>>> Shikra. You say that the initialization is different, but you use
> >>>>> exactly the same initialization. So in a meaning of compatibility
> >>>>> between hardware for Devicetree they are compatible.
> >>>>>
> >>>> Hi Krzysztof,
> >>>>
> >>>>    There are 3 things:
> >>>>
> >>>> 1. Clocks used:
> >>>> -> Talos supports AUX Clock since it supports DP over USB.
> >>>> -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
> >>>>
> >>>> 2. Phy register Init sequence - same for all 3 targets
> >>>>
> >>>> 3. Regulator init load:
> >>>> -> Different for both Talos and Agatti
> >>>> -> Recommendation is to use Talos regulator load values.
> >>>>
> >>>> SW interface wise, shikra is comaptible with agatti. If we use agatti as
> >>>> fallback, we would end up using the platform data of Agatti where the
> >>>> regulator init load is not suitable for Shikra. Hence not using Agatti
> >>>> as fallback.
> >>>>
> >>>> Coming to driver changes, I used qcs615_cfg because it has required phy
> >>>> register sequence and regulator init load as needed by shikra.
> >>>
> >>> So is it compatible with QCS615? If not, then something is incomplete or
> >>> confusing. The driver uses the same software interface.
> >>>
> >> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
> >> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
> >> the two PHYs are not compatible with each other.
> > 
> > According to the memory map, there is an (unused) DP registers part
> > right after the QMP USB3 PHY. So, sofware-wise it is compatible to
> > Talos. Having the different clock input means different integration of
> > the block rather than the differences in the hardware block.
> > 
> > So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy
> 
> It should still carry its own compatible though, to let the driver
> disallow powering up the DP part

Why? The DP part is there, in the PHY, pretty much like it's present on
most of USBC platforms. I assume it can be powered on.  There is no
point in it though as there is no DP controller (nor DP pins).

-- 
With best wishes
Dmitry
