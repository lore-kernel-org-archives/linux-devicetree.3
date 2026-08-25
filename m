Received: from benson.vs.mythic-beasts.com (benson.vs.mythic-beasts.com [46.235.224.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57C448D11
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666328; cv=none; b=WL1Gvt1rUPrY68TU3ADtnJ1L+4/NLsgtSdk1jlo94Qr2fN4uIW3vBjzhEh8ml2rcsEEvAHfQKLaA1IWL9X7eA/4wcwsjRqwEPhBEi+aR0U7EB6IQsk5AmjTgJw2RiO6jlRC7Nft43m3E3lYavmfMivDWI0vEA7vcN0axyN0Oa6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666328; c=relaxed/simple;
	bh=yqgcW1n+Y5bcbFc6n2khj/wGsglXZfE8IXzJOSOd+so=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KmpTJ/AJEvmkJxByJ3dceOkmHXQ/gcEmDiWIN6poysX1OB60D+T/SFYFj6cLl6E6/hlEwzWgi2ULwXeYfT9ZPDaFDie2qr2mae54RXb2S+N1XXfR5WYLdZbLXAakNtWe29zIjCS1yHA9Zx5YlTWAq4KNNdpYf5yxAL4+OzYG3Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hellion.org.uk; spf=pass smtp.mailfrom=hellion.org.uk; dkim=pass (2048-bit key) header.d=hellion.org.uk header.i=@hellion.org.uk header.b=CWDFn8V3; arc=none smtp.client-ip=46.235.224.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hellion.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hellion.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hellion.org.uk header.i=@hellion.org.uk header.b="CWDFn8V3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=hellion.org.uk; s=benson; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yqgcW1n+Y5bcbFc6n2khj/wGsglXZfE8IXzJOSOd+so=; b=CWDFn8V3oi3ZZT8b7iaDOAYb9X
	fUla8vQ73sGnulDYuLeZLoGyjtOFyIgrwLwXZp7qCWGraAIfQhKVAEKEbMR1AeU2mDhrxyPYOeUEI
	RSwrfAJ5WOiVcY8xS2A5dZPFyxbrnMh9b3QDbEemCT/l4XRh8zQi88cvBw1sKmJBEwaBaIsriNYz0
	bf9xk1cFby1ePSM9EcVV5GJ2J2xDQQEyPtPiFxS/XIuYFf75OINOzTpQOoW4F5LlAfUWhlS++Spm3
	Z2ywjcI9Hi+ldrO55rGb+MlSq9aFXU4Y4ten3pT1TNCxh1NsHp9AKypw+AApTMcGPTc42MNWmd/NW
	v/wmU/tQ==;
Received: from [2a02:390:60b6:1:371a:efa2:b3ea:6625]
	by benson.vs.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ijc@hellion.org.uk>)
	id 1wyrfh-004dgZ-1D;
	Tue, 25 Aug 2026 13:58:37 +0000
Message-ID: <9e4175b792e9617966ce892d6a65b4c81f8029db.camel@hellion.org.uk>
Subject: Re: devicetree-rebasing history incorrect from v7.2-rc1-dts onwards
From: Ian Campbell <ijc@hellion.org.uk>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree@vger.kernel.org
Date: Tue, 25 Aug 2026 14:58:37 +0100
In-Reply-To: <20260825134125.GQ523975@bill-the-cat>
References: <fe88ed4f288c261373d2ad7184f470a8ea19ec42.camel@hellion.org.uk>
	 <c0ef5f140cb5e4e1b953b42c3518a5a432c67a93.camel@hellion.org.uk>
	 <20260825134125.GQ523975@bill-the-cat>
Autocrypt: addr=ijc@hellion.org.uk; prefer-encrypt=mutual;
 keydata=mQINBE24IUcBEACis9e3QtgcOOHlbqjgVXScdxud6AvE5ziXGM7vt1AFudWqVqWfyXoEA
 22l1qG2l54Fe/+sWJ5y43ReROOlTRUIyx40Xz8dVj35/PJZ442elpUz5IcaKUNX/cgGen0I98VRoN
 UUCZQfuxg3y0CgHU2S5U7ETSKxVx0E2UYZOqsaU4gYQjmnly1uvkNiEthdDB+15yL0YpqA8g2OcQs
 fh6WmfM2bo78tLvsQj6zlEhiaUimUUlSMZ8X38FK4hC8x353LO8K+9yryX5SMBPYsi8GlD0x12mL7
 v2TayIxKJP8iKpXL1TU6rnrxs2Q8wyPIuosK9nVx24o8hAA/Otb10PbO9iQqwLk0COZ760m+OR5rA
 x2VzbJ3oyqU694P6Y8hmxtYF5sw+CB6UWxDxHHeyX6hZIulBeFq0V9trpBBo2pV06r5AWZtGK4GTR
 lAAR9b96wFFqyCvDFvSIOTYcsqTY2aUxzUPYDlvPrGxQy+OWRvPnH7BM6QAybwMrFbNZltqSXIZcl
 kO1wDAafmgMr5soM12KSl4HaptVTp1PO41yezMqSEYsB+6XjSFsEMMugd0OBUlnIU7tgiiyd9Pe4H
 VjnRUl/EuUC6KR+bWftUSEpcgsaJO6EK1rqlxZJnG0Woi6C89wWTxwE3Y/X7wFdVjvdxZnBnPEekd
 3VlBxdd/3a2FQARAQABtCFJYW4gQ2FtcGJlbGwgPGlqY0BoZWxsaW9uLm9yZy51az6JAlcEEwEIAE
 ECGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4ACGQEWIQSdXO4BM09Gzi/vbcbsY2mXeQdPqAUCaYR
 MNQUJLtOBbgAKCRDsY2mXeQdPqIRrD/9QJuO0w6mXhJ6KHI/WL8h+Hp2sQADW+rWWN7T+KVBQxVc0
 eXtr+SEQurA5gGfVwdO5bGERki8cjGWFMcQpV8lPP/wOUPMQdtf/6b0J0HQ1+K3esXz5iAD4Ebudw
 elUD7+iZnqaJKcV8JQozBWCNSfElWZhcQ5jVQy85jq5cXBlnrEAjAeDxuEbnh+SeUCod2fvy5ln9N
 G2HPgJFfa7RLct4sAY2iAE+qPWP+im3/qVJdyATSYB9Uee6JvrEjLhBkv2Hx+sGBcdF+Yrjq9X/0c
 ZYBxv8sJHiNH7pw+D4Dj7GQt1gxuUq9VTvPzGv6oohzhyp7Es8sZOxKuRToVuuazxp+Oz6VjVvc3c
 HupZso4tGer3TfItiulWSyFKhkvUpSt1/pnSH4KCouKsvq7bpOpTN8F8S6afp5Wr+aZJpiasYbR0Z
 d7oCMrOE02/gCUIkDOuR2gs+/u9fu5t/8GLIbktmEeg+DvPvB87abX6BQhaO2ThAGW2//NnKRcIp8
 DvAiWUlyuYIAT54PnAs6WWvVTHsKFuvWKuCdOSSMvATpq/zuLXxJd540CscYGqbTQrSk/v3i6Iyu9
 9edBcgG5JEhw9/hIBjqfe0gqymZ3E1kmiMMcH7XQk2/10SrWKx7gW21NivUcNuEtZOJTPstR1rjSX
 GaM/EWspb0GheAZ7VKBqw7Q9SWFuIENhbXBiZWxsIChDaXRyaXggU3lzdGVtcywgSW5jLikgPElhb
 i5DYW1wYmVsbEBjaXRyaXguY29tPokCHwQwAQgACQUCVtLFGgIdIAAKCRDsY2mXeQdPqMNgEACVka
 iRv0hsE9KO4I8x+2yByqRQYX1aUAlkv2ds10Xisy9JEprlTl4dHr2kxw4JwsMxUpN9ZiyVjWDXkTa
 EasmjhbKCJSYzpw+BsT0p2F6/RC1NsBJcZhwef0/wf5PHC6ws5NHM1gmyK6Q608FL51qYm3cHDTSA
 LgM95B4yt7cArYovDcVoDEMkucxEG2JtlWOmXLTWoKpl6xaHjbrMS7KrEA2WvXtPFCz+0bdhDE0yk
 ECte5jaw3+HHcJtCVd6pZAtIhq1QmepCfSsdVYLnAVK7g2odJ6aUcF0weWaBSwX34h5/z9O0uQZ5z
 skqhLqfZbK/qC1REKrlUW3rcbIgxxdjqJx750ftBLkTBgo+xbK7cspDUXj3IkIaJ4yC7v4ghwbbr0
 PiPRBHvJWACZ81c7vqkhAn54xEqeBxvJIKoNY5g164kegcHcxFq8GrjTWsQut5X7S8TJ7I+BcnzKe
 qKDtJ07RXjC0WB3RfzyePdImOMcHZUtvmjV/yTUFWyjWltDC8IHnnZdCAgeYqOuQK+Vh2KjxXALbL
 zokfLhjPCZ3+pVaOloDzstCZpnU96S6JEM42g1rTbBaGLFWHpyiBJToX8gH5mItzxRI3gbJN8jnTX
 Ux4xwhs6Xi09gYxstIxMlxJ/E8aexHQf/KeqMxEutqZrfvzR4BYjBpygQQFJZQM7QkSWFuIENhbXB
 iZWxsIChYZW4ub3JnKSA8aWpjQHhlbi5vcmc+iQJUBBMBCAA+AhsDBQsJCAcDBRUKCQgLBRYCAwEA
 Ah4BAheAFiEEnVzuATNPRs4v723G7GNpl3kHT6gFAmmETDgFCS7TgW4ACgkQ7GNpl3kHT6idKRAAn
 Cb8sedj6SGoupZxVm7W2YIfoWlU+a5B5CY7QfNXfO6krAJR7JBydZnSUDOcEle5KKgoOKAkF2Ccsq
 NUm9BdIaZ/ksn4eJMbEpD1Dy1wKmED6YlFyXVvXtQScph/buBZlxo9uURzsooTPSZMZRxRy6rPv+K
 HEKBzJ+32zsILxbEGDtcFcM17TrcXFgVHexXxMCl2faMJHh8aSFmdclVfDDWy9b702ASE1P3AeDdk
 qJk+JwMCk1P7jWXilyrNHGUY8/NSKPIXLovou2tVYhcHWaOD/4uZrNTbgwBIx8pdxnILiRpzLLL3s
 5oYc/rWURe29OPbX1gy5Yy5svmqMN3DUa8W4sDj59VnIaiT3EbDGzcpu768qg9QZ5PX8+xcXVo08b
 XRbJmtNStrHnRwgr2PWOT4fEdN9tt/tn//csdXbmNAef6bT/UTI/+oht0AZRNGtcARWj1dXOzCns6
 omBIyo3acYhFLCZ8cMxhzEQpb2DQQ+ziBHPcG+XYwuZ0Pk1h3vSgyyUSXk4CR95J++aB8GSCYT9cC
 L53GWQ50NSTI0c2gSz8s8WqfcqhAtygxpWRx3Npf4Qp2Gr9aeGzxZZ77jUaMl3yEdBBD3NREOjywu
 Sq/B7WR9+4JsQU56bf4lFwAd6fn/LJNmqXVCB/8FwQuZiq+8HK5vDWFEQNkkqZgHWK0HUlhbiBDYW
 1wYmVsbCA8aWpjQGRlYmlhbi5vcmc+iQJUBBMBCAA+AhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAhe
 AFiEEnVzuATNPRs4v723G7GNpl3kHT6gFAmmETDgFCS7TgW4ACgkQ7GNpl3kHT6jt4Q/+IDuWLrfl
 YUhuhO5Bre0aSzgNJb4179CQu/9tbq/umKFQ4DgVXHX/epAN2HsnbXyLS0T8xbJBeym202xGTi/4P
 8gUEbVaWnzxizHlAwnBhrFq4U7hzTd3PTzuMSLFMv29dTOOah+xnjL6Urix0rkR99+5QLgBW6Alf3
 J2FkM4un/KFgwuOx4cFrOhZGC18IVEgXkl7p3Wu6r1ejC9dYLpsDPRTa93wMrYPeqj1h8rmDuLEg4
 57UVoL10yhjjy0tiwnsYCYI74tTx+5D8QO4udP1U5ki+c9DfJT3r9j72OiPTjhiYld9mlfMh1p6HQ
 GjqLIIap8BWRI7dwCJwlMw6hRDl4BjYnUmTwEo8Zadoid97IZeeh6VgsZB0jl/gyr1FLAkYnmx5RT
 41jhCqNLex8VyjOZ0x6dHb7czuV+Qi5Nqc6vkjvxlA9F1UkAs+QSF3PvmlBep5RhPwC7iiTlTvdpZ
 z/53XiARdJhDMpT6cwxCB1QIijmeLXVaVC+zIkHkp6mKJK1J89F2rsQ2NipR81ncf9rKHdPVrG/9D
 1FbmnR2JM6+WjQppy8vk48PVPxePzafltgkDvR5LOkUoYr84I89xME+tBE8AZteS/JYk96IxDlo4z
 nCSCXK8lt8P94YL8qPC9gZB6aQOu/r7j4R3LJCu/unDLpTLxamo3Fzxh/2O0JUlhbiBDYW1wYmVsb
 CA8aWFuQHRoZS1jYW1wYmVsbHMubmFtZT6JAlQEEwEIAD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHg
 ECF4AWIQSdXO4BM09Gzi/vbcbsY2mXeQdPqAUCaYRMOAUJLtOBbgAKCRDsY2mXeQdPqJOAD/90Vfg
 kKAZPVdWkoV9b88S5vIzvXgESkxzMt6gxbD7CRjKn6IUY3kob6IezxEVJ7+gHWNMv7fTx0sQ3sugB
 2gwRqZkNOf0qJx0Pvzw2oKHI9oh2/6rIk+WhnbwpWDAOVwl0adMNREbfDt7HJakk3SJaiLPEIFim1
 SlSHPv63baRir81SMq6mRhfQ+jv9Rl73YR330ZIhOiztgd+VN+jrZRobHF5lqodkfLREwBQnjBmMa
 FYlWV0bjHnqEKznHw0zXv8v6j0Em6Ncx8vAgiQkOJLFFIXDwJJ8FxyhXA2bdb6dazICd3IwtRjpO6
 GajXMX28P79iEenjsppO0QecG653Rkl0UKIp0f9EZetJWEi/iKpGrBSR+GZhTAmm9W/KwzbfBGqAJ
 7AiGDiWvBqwcHLogvXO6vnV1bV7jURgDlfFBCQFIMhrMDsLLb+WU9r79VpF1L6P5MBMrSC/br1N3r
 alNHnPCZoG3BgU/s4QEW0Cc+f9S6at56MJWsNrBitoajpuaMfWL5kKlurD8G5McnRcyVxRI3u2hZg
 42s0MZSiUXCbYwF5czqA7gj1FKIzwMxH6hkTAR6LTgtXeivL3hk2PF0rOkpKuVecmbhLUCWv29bdk
 oK9atYfnHXbeZ2b6zk0fSy+xhGNCW2cSgC7+ECiliEuQ/bRPQP4tYRgBCPm5hwrQ0SWFuIENhbXBi
 ZWxsIChEb2NrZXIgSW5jLikgPGlhbi5jYW1wYmVsbEBkb2NrZXIuY29tPokCUAQwAQgAOhYhBJ1c7
 gEzT0bOL+9txuxjaZd5B0+oBQJgVb8wHB0gQ2hhbmdlZCBlbXBsb3ltZW50IGluIDIwMTkACgkQ7G
 Npl3kHT6g7Cg//RrNSCQpHwkJwAizXavOFSbZLNchBp3fUclfV1wQ4ZLgOLhoPNj/z0jrS4CkZozc
 t1dZ/nEFUXSNp0r/fLpwGXBg+uNc3YZMWepVbgeb/KYLYMDjYWBjiHV7PAw310KTynPgF3JKs6H+L
 FxKA2gk6UggJmqs1em04IWuDKdBQQPyGQ/hlC22hkiGb/eCce8LgM9RYlSnmBKQr0KU6cVE2Lubu2
 gQYPeC89yajXZVixVTBV4808+mJh3gYsjMX+7cZpNd12V2QS+5PH+Kaf9QUA07gS1NnuRHzjhBmhH
 KbjNIMKk80/to+weZg7iBXOlzN6E5DomsdexYSeCNJ+iolMbIVCfGhkgdpDACsP56A1uo4ACxYf8r
 9qlPHlBbui5F8WFFCg0XDelZGXNB+9e92KpQJKjFHa458uPNcZXGJW73Iy53gZZqqurUO6AXhIZLL
 T1wJ2gMH5zqDPMjKSnhvrBoFpYCbYxGxFaz/TNvdShRhMo35F5x6i8CN3u/VElydDPC3bM1mSPFpZ
 gMiodHuY72j8AFXeiyKziynGhD6J9yoFumssj3LP7LqoYQXp+t/3qi+4/jzpBtHS4VKXA7zQ91r3Q
 3kQA0d2a+sNSUfgE59b/8UbWghprzmCHfrMjy/xQJU+8nuWqArsVZmGD+ykJTRljtejJzo1iwDQbQ
 7EkG0IklhbiBDYW1wYmVsbCAoWEJPVykgPGlhbkB4Ym93LmNvbT6JAlQEEwEIAD4CGwMFCwkIBwMF
 FQoJCAsFFgIDAQACHgECF4AWIQSdXO4BM09Gzi/vbcbsY2mXeQdPqAUCaYRMOQUJLtOBbgAKCRDsY
 2mXeQdPqFSTD/49+90Jg9uw67RCNye1THsiB7c+B3RA9lDupI5MKDB+1MB9GfLaAecU3HFzM+EgQB
 jMrx7Z+/F3Xz26O2+duFTK9gPOPGo322inGhw+72JtdvGlHmq3RDg0kbiB1H6YxDvNoB1wZN6PCow
 0esVhZ13fGS7wTfLH5UB0rSIVYMgs7qlEliDJkohTWKFbIfNRZ8+/Nv/DhpUl5H2pZp9HYkvN9riZ
 NhtXlbO+GyEfTG8Thz67dD0eaaREDDEnXlmv4vrft8a7paSbg7bxDjEJt90GIQ3tzqILIJ93Qb9Ak
 B5cABvn+BWS0yzFvN5yp7qwwBUmSwEzFdG1GVARXZya7C5wYFkizn3mVripScIW8EdtlcXQaePEEt
 vb4fM50tRfDq6s2EfZl7XdBiNcxPby1fePl75BAWKG8njQYCsOc0BC6xVMh3vXcxivHmyQTOn/Uxc
 QvGb95SGp5326Ih8yPcbtgfWSgexolyCOUdd3UoxJXb9i6CH9xqPewKdqpNmKgFD5ZLVDhxwjzKUf
 mpnSK8E0CcQd2qjof2sTKqLVAyxdxGYXOU7h+jgIHQJDVKAYOTtpj13al36LQqfNLTT3hrXWonu6n
 GyWyJclmZoLPUCMiyYkhmJTZse9+uHaDqGMrhbf7Gr5iDvvdhYUhUX8Js01ptPBgKGDx4qIwiuI3L
 ZunA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-08-25 at 07:41 -0600, Tom Rini wrote:
>=20
> And I can confirm things are looking good on this end again as well,
> thanks for digging!

Great, thanks for confirming (and reporting in the first place)!

Ian.
