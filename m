Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F53D5648
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987479; cv=none; b=rplBngSe3YWMRmV5TpcoNnSgZpDkLJ/mZsDYckHf7m1zEUNtt+9e5hbeQsaaUMO7XP3dqYaE1VO2w6DZsk4BbXR4x6A+UHp0HwFuA0+Cb55ob7VdJnQFixj7VyKir5HchQ2NT0OUrfKPccbu0ixpDIzM9F60dO8rG2+1yH/z+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987479; c=relaxed/simple;
	bh=BDmAOXk/J0il5WGjLq49F7s//UAnHfnxlMZpGTigT3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CC7nWsTmErHog18b6WJCH2+tfw8NLUsUMpOgnpLlewWTD8saVPf5JNmM3mTLtZ1ewCFMUENLFqpzHh4PU4ut9P84gtXP1jEFJm2ws1+lkaz2SXmgdwYfjTz3iAjxPlYs4RWd044tan5K5grSspj2DKqs/6H9pKZaVysp3M6WSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBQnBnW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpMyZtrM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBQnBnW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpMyZtrM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JIc4A3067042
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 20:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aD1svCqhonHuEhBxqeD/lMr7
	ELQWc/Ex9Uh61jsKr0I=; b=XBQnBnW+o0JuCdB1nHL7fsroyLQyb4ry0bYaN3EI
	ZTdLoK43rd2Apyj64z62cFGax6reUMgTQH3xkaLqf+WbKbwP1yQ4xRrEE/SQR//f
	7ZRSfPC9SPLkHGrP329/P3RkqLBSt5QUQ7GWMUA0GIy4Ev0ITk26HGULM79d4/LQ
	Zj53VfleseFH/KN1lBauIOMoObdOCgLv3IX8uLGODFfd61SyfxOPoNKFLfIWZcmt
	42wwSamxdxHFrLYmw7OHxa8LLYw5ts/5aKJJmTwmOC0AwGfI7gpYXLpAh1vRcqjp
	hfo7U4cE+5iiJB8uhDkC4gP9MxtlfQU/aDRoUB5DRV8/ww==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg0m6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 20:57:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9cc5ac86so580006241.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788987466; x=1789592266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aD1svCqhonHuEhBxqeD/lMr7ELQWc/Ex9Uh61jsKr0I=;
        b=KpMyZtrML7UgBeUFjYkGYWIj1NQuJ2HMeDNs7sOLg+Q9RR2QWFlAEqaNXsI+jwsBeH
         Vv9V3jc+1+kIBH/WQh27eH2o8edyeLp44um0LuzSuJJxtIH1gKwcLZTn8AmmpGQOXyMS
         nyEMF1hRvC3LbSQbbu5xRWWlBYI0LtATvu8bNZr1IHof/BTU8ZkZoQhMMwgQF9olMknF
         d/4SpbTf5vY8JY7jZKc7z+ngoajq2iw/VecIPjAKkUm6dxMMedgxETr25r+izTdAPDyL
         1DVvK5p8t/tgaHtqVxrxeK/iB/MglJsUVWsfxm9szJSt5haVdp6j4tAu+iGyysh6ySnJ
         9hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987466; x=1789592266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD1svCqhonHuEhBxqeD/lMr7ELQWc/Ex9Uh61jsKr0I=;
        b=fxvnyEEe62j/+50QcZqdMbd4AlFK1XqjLDXFXMx/woUMhKoDQoR6Bvu2ggl6xTcMfi
         lTRLq/E+fmLANMWw/0D4v5OALG1wmtRF0DBxWe8zQriqVntQRJ3O65SfkrUF9IiaB3in
         W22qcXuy0pxBaSnlK1fmv20S/Rwd33F4cJjdt1YUmZnFvN8UU+umiFUaO2i5ooSbBKjS
         h4GfRHuRt8my8mmkgRqR0lY30datspiZ26r1Q+CMqPQfwgDwXJTVEnHyKUmRHZaKpYrr
         g6dsZbgXSTysALj4S20JwD/LrW/sE7xOxBOKzAoKDTnfgIU1/o9KxzZcpjvJ3Vn9QYKh
         UOcA==
X-Forwarded-Encrypted: i=1; AKwUvByqcxXEQ14S7WHN6khMKu2/qX23peME79bd7RSiMV6aaoQvupu5Y0rln0lxtXl7VNbUi8+UQKwPM5VS@vger.kernel.org
X-Gm-Message-State: AFuF++nG/iY+SVGAMazyO5nBylWhrly6+ozN0XOwVQxDPO9TMTU6ja+V
	MVASyAXteMroQI8JndEHFgCpUVzfRcdC8uNkABxdV29g2WT8y3ZESJ/eLxd2f2bL+g1GF8JP+Xo
	bTGQTwaRctkOXrhwN9oKDPdbrni/vfXCzVORDBzWhLdRUl5rSr6nXZdCFJ8jBSUa2
X-Gm-Gg: AYBFou2KRI6OTW5x+I64VKvK8DKwrBUIRQ1YlaAL+/qULRgawQx2rDesh8lOQtxx5bT
	c9XoLcbnTug07aByaqb30KFbJhHWWk3PwhPoGlbWP5dI8GykYlxL/WsJXxtQeQpY8tdHv/en+pr
	gq6QcpSBbIDMfoz+loEYGffdoxXjRNxty35QEpPwiOKqgiCsm1Yw01Ds/kyM/e52VUTA4GiKjvg
	YOJrMxBe88KLTxREasE6CGio9hBQMzhp7FkAbKez+IgJvpR+MhwfycGCzWYyrEQzOz2ixXbFkK4
	bzqwYBinw+pydkOd6s5JAFMQcb0iDmglK0LwyXEShHTvQgsbtIdBOUE5ogAaBPrc0lbsy/Ay6Eh
	Rw/URh/V5O1/6+Jbgzk+T8VvDiYi5PfgHiaz4ptme05rEAifmpH4zgPxfcMo37Y0uzAG90hxsGp
	+a8dpY6cvB/fCz
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id ada2fe7eead31-78a4a8be7c5mr16080475137.2.1788987466100;
        Wed, 09 Sep 2026 13:57:46 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id ada2fe7eead31-78a4a8be7c5mr16080274137.2.1788987460865;
        Wed, 09 Sep 2026 13:57:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765bfc42bsm728249e87.18.2026.09.09.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:57:39 -0700 (PDT)
Date: Wed, 9 Sep 2026 23:57:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
Message-ID: <dulfxazlrtqc4swjeuxmriudzzm23z3wea5n7tfflaeb5644kg@6buydclxzmab>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa1c84a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=JqCuCV_VPJ6-B_cMBtcA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: De2E9FsBixbbRGV6rEIJLstQfqvCBDzL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNSBTYWx0ZWRfX9bRl+M2kYyX0
 +hjEbKxZGCN9EVpa6XqCUarQrdUbBiWo5QY0PW6P7wa4I1ESisa2Nks5AMXQvyVPGRawu25tUxF
 9VSTX8drPiyJ3nRnvDVF/Z9jeCR3kkATJNsNE6Q6Okj3qZTvakd7zcUVEZT51Ti1U7E59dR/BxW
 sQtZDJwC/HqbfSJbJvZjsFq2BcSMnCYz/Lj5/9ctHlb2NppBgAJ0FZmg4iauFie680EWlM9W4BV
 9oa1N0snhEBf+NmmMj+bLXUkDsxnKbPhWxNQNgMR5Rsaa2VZjywwN/tWSJHNrlzFdjwf37di5p/
 ZpaAlRUuwRN+nv9pEly6JyfpVulAZAOjpvC6Z0SHV+fsK38GLRpfyZAWlWuG1zqa+1qXGZK2f0s
 j6FFzdwkZuRRyxCLXMRBD/rnJ5Qy8jPTHO5n5TowQ8QvVhfvLwoqdP+DvWujk8udG3uXFSufX3O
 iI/iUhvlTt/LS/077Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNSBTYWx0ZWRfX45epO587s5KN
 xt9I9V1oC4smixTVWjCIY9ZKW/4wdY+LVn33QKh3BDMiM3YgCbGzkFwGDCEy5qUJZXZ9sryzqHj
 rmZHEhP5YZWtSk7ejWvO6nzL/ytdLx4=
X-Proofpoint-ORIG-GUID: De2E9FsBixbbRGV6rEIJLstQfqvCBDzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090235

On Wed, Sep 09, 2026 at 08:27:09PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was
> discussed and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach was
> later concluded to be a hack to avoid having subnodes, and was NAKed by
> the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> Update example to the subnode form. Doing so, it picks up the supporting
> properties needed on the video-codec node, address-cells, size-cells and
> dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
> with address-cells and size-cells as 2, update the video-codec "reg"
> accordingly.
> 
> This patch depends-on:
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Tested-by: Daniel J Blueman <daniel@quora.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 118 ++++++++++++---------
>  1 file changed, 67 insertions(+), 51 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..dd80526838f1193f4c9105793ae4bf4fe0755ec2 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -98,10 +98,10 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus
>    - dma-coherent
>  
>  allOf:
> +  - $ref: qcom,venus-common.yaml#
>    - if:
>        properties:
>          compatible:
> @@ -150,70 +150,86 @@ examples:
>      #include <dt-bindings/power/qcom-rpmpd.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
>  
> -    video-codec@aa00000 {
> -        compatible = "qcom,sm8550-iris";
> -        reg = <0x0aa00000 0xf0000>;
> -        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

No. The SoC node must go away. None of the schema examples have it.

>  
> -        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> -                        <&videocc VIDEO_CC_MVS0_GDSC>,
> -                        <&rpmhpd RPMHPD_MXC>,
> -                        <&rpmhpd RPMHPD_MMCX>;

-- 
With best wishes
Dmitry
