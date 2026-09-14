Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80646C821
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394804; cv=none; b=ShpKVfGosVi4EPo/JJtrMz6RHEz3TL2qxDziy0XMm5rw1QorEwnyXle1L4fIBmAtWGcD0gx+FLV2+PgYi9fcUCOpt4Sq2eiLFMbYTraJ8isAXga0p2l0/p4DoDm+fskk0BmfRCE+ZQv+xOShI7TB4yuPvCKaUoh+VL3pSruPJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394804; c=relaxed/simple;
	bh=M1jhzEngeUQmZn4epgWhZIt5mhVknLgHn2qil+s31Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2KMW0fNpXG4cUTBzLZJN7T4XB1PA5ENdeDp38K/McN/dRxYEP+J1pYLbxRW4cTzPSnwjrFswwmM2AUFJJzmny4ZDPGVUVk3XdOiu0n4+LwBzZ9F6EeC1/DTHA/DF6hinI1L9+oWeVXlaKKT+74r+I9QG4kYUzZ+O0IYsddx4Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqIGYLXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+JIRpX4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqIGYLXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+JIRpX4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0OwK607370
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gnji4ta6O43OZz9qRSk1IXl6
	BaqNTU48rGVf9Qgbt2Q=; b=eqIGYLXYh1Nrbcio2AowZkZ9hL1O7bP2EEQyJ99k
	Hm01vqRYf/BPLVbXrx+QJMlWOsKsRycWjiILJBeKLBbiamFDONALt1GJnzPwPUb/
	EEek1Zjl9uU/W7FIvbHmhRS2S9so8eH8UwDlMV+vxpz8E55y9jn0cBKqvrNf43mJ
	GSNOWnQ94bNjLsGqG8yAYQMk+/StYthr3vy1tiNqQy6B5k5D/8w/qwHY4tf7ryf9
	Js40TADRP59yyOo6rCUV7cNALp73oTnky/mWCCcRBybjXKX+9IvfWR9Zm/nv2Eit
	NAr19HPKiRzrvB1rog0SKpa7k8TZsUt5KmwEAl9F4pPqRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2krjdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:06:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso465765785a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394799; x=1789999599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gnji4ta6O43OZz9qRSk1IXl6BaqNTU48rGVf9Qgbt2Q=;
        b=g+JIRpX4VFM2tviVcGliuHjR4GzDw9db0TJprufp1vnHKNQBIHQzvdN2xjF02Nh+tF
         lwDtN9oHVlTLYKRZzADQLFoAELwx85Q4eSEd9EvfFfTzSU2gkvV6Nje/n/kF//WEQZLj
         sVM6j7S87ex65V0cfS5D6E8y/enL/7HfYQetY6j1cLoAyfMklfCwjRDJb31MlYYMZyix
         OufdbHk5lYG2bjySWsR7LvamxmmtWn4rQ6nNpYmSr3QewENRE24VSB6zaFya6Cbrutt1
         krT12Yx+OFvS2+oqa+vuAvorZ+VKzweNV1YVJgMwHyw6TtFoALUXc6VpfHZTvh22iUE/
         1jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394799; x=1789999599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gnji4ta6O43OZz9qRSk1IXl6BaqNTU48rGVf9Qgbt2Q=;
        b=sw0brBBD8/Y+ng/uXG/2Ahs+EHcAl7/lyNJiSQpd2eGv88a00NFkzlOOCBT044SY6n
         p0Euc1TC1RW3v5QHx5ADfyia/s7HEZNSmg1j5bz7GgqunQc6ZsI5DC1g2qUkn2cH9Xc8
         scL1lPAAZgG7uKWb9SIRDZjdF+17Gjzhs0H4gxq8WVNsmeR0RdGS++EiSbtf2Fyh3xrp
         VStw1NjIVrs14msZneoSze8Vp+aDUbYhXD7WLHYYLx2dsieBp44awn9f6b2OZb9P51u5
         tt9Z7ws7bG52mFr4jlX4ZQYqWNel3rGCZmPnW+ljhgEI82dj50ysAaB9S1jFLzCi3hX7
         /MMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+uYjakQqKxDyAVHFoXOsub9bca7q7VxSGe7r6hZKQzPUDc3riyoWejA12r9OvNCeQxm1T9mOGvyFd@vger.kernel.org
X-Gm-Message-State: AFuF++m7onq6Ea2TMakIYpkZ2dVAV+FIq7IsicBKIox3ARzykIzUC8Hy
	HIidYNEY/8JlWH5rzslE9tXveT8rMeP84NkQ66vMi4kx7ibueHxOYaIJuq/nOJOJrSMDzX2m2Jh
	42JafGQnh1A8aEOONXl5O+jhbAsJz7uZbEMoSuNisuLnMFTRXj2aKyi0HqHLODlKJ
X-Gm-Gg: AYBFou0oNFQDfuXywmVuRZKYkwWTJt/Ao9B90fM2GWbxK1mzvyGR/tW8CZcdil85M/Q
	E726Z9aTK+Nn7UgCM8jnby/hs4cKVvQhdce+lN6kK26fTg68OAzfwsOJE6r6vULbAZRmpNZLxEg
	qSAtJGY2ojkM4WdthC0ODb+3eGV22CUnJlc1PUwaj2wmRl4K+Gv1ebzvGF4CjiLweEyS5O7V0Vi
	B70LeWqq/3gYc5kP81R1McsoNam7xjIFQd9zSpjKEbPMThZOyxB37rX4hpG2yLJhWvfOJjFYGHY
	3h/uNfXzKEGnLnG5paXRpCcgel4alMQLGePfp7XbkK95fg9Af6QdWJhuAaCzqRMD+JDZbAgZ6Q+
	cYSNFPpFhXAprD2A=
X-Received: by 2002:a05:620a:640b:b0:939:6de6:9517 with SMTP id af79cd13be357-93a29a92a0bmr442389685a.46.1789394799418;
        Mon, 14 Sep 2026 07:06:39 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:6de6:9517 with SMTP id af79cd13be357-93a29a92a0bmr442377585a.46.1789394798784;
        Mon, 14 Sep 2026 07:06:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm432396285e9.5.2026.09.14.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:06:37 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:06:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Message-ID: <chmhun7dqj5flvbkzpsoz3pdbjrcbplel5rqfvj3fc6ztaw2sa@4o55fods7yaf>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pZcF5EDMfF9_Nnf-ButXOcwsWtqe6Nyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfXymfTYZudmF5l
 9M5t789Ue852DcLVv5fXdCp9aU1I+7TyKdM5CXijB7ZhpfFY1NGBXV047zuARTS+m7qZchQXebm
 kIKa/Usz6yOeZHYow/Zllh6Yb4zbdwOAr7J4dXxAx642YMJkaIePoDDbcYbjzMoQsNEHa5Q3B1R
 fbIGv2+Tqtpr28P9c+XnTGbFhKMHJ+zP9Z1XZ1+j0nVYTFJ8UiVP3ETuVle22IxSwhlEOOCeS3E
 hT/8UUtfSVHz2drEHcLmQXPs0sOeLPXPvHpK3VqL2ogtiq7wh9Dxh1cmGwbFzRcW5WWlsm0yuxo
 Ta3PGJzFRlVc7+kHUU/xqIeL3eWPN/c2g/AULVw6kvrG4KZtj3DGQktGN9IhQqFiDU6WU0BOAqv
 S/7ShJiOUqzR8YoaYJp25n5He7ZTRdGPr2gBXe1gyhKEa8Iu6cGlXzhel1Qr7om4oDEVA8UNdst
 tiBzlU1ZSfRr35WArag==
X-Proofpoint-GUID: pZcF5EDMfF9_Nnf-ButXOcwsWtqe6Nyn
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ff70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ucACzhYzkOUm8HD49FUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX9zkl/wTLc7D/
 5zxae1ppNjxF/pwJWZQB93WQxPI3iCyK1Oq/Z8KB8YM5zDAiPgLmKnoynwaI2dfd5IQh3g8qkIt
 B3qVqftISwceDZV7Cg93t1a3rKgRxJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140202

On 26-09-11 22:17:07, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

One nit below.

With Konrad's comments addressed, I think it looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 114 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 624a9edd602c..7bbc804ed340 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* QUSB4 1 PHY RX 1 */
>  				 <0>,				/* QUSB4 2 PHY RX 0 */
>  				 <0>,				/* QUSB4 2 PHY RX 1 */
> -				 <0>,				/* UFS PHY RX Symbol 0 */
> -				 <0>,				/* UFS PHY RX Symbol 1 */
> -				 <0>,				/* UFS PHY TX Symbol 0 */
> +				 <&ufs_mem_phy 0>,		/* UFS PHY RX Symbol 0 */
> +				 <&ufs_mem_phy 1>,		/* UFS PHY RX Symbol 1 */
> +				 <&ufs_mem_phy 2>,		/* UFS PHY TX Symbol 0 */
>  				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> @@ -4103,6 +4103,114 @@ rng: rng@10c3000 {
>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,glymur-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 /* UFS and PCIE4 shares the same clkref on glymur */

On top of Konrad's comment, I'd drop the "on glymur" part entirely here.
